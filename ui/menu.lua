-- Clickable menu system for superwarp
-- Allows browsing and clicking warp destinations through a 3-level drill-down UI
local texts = require('texts')
local buttons = require('ui/buttons')
require('tables')

local menu = {}

-- Send mode options
local SEND_MODES = { 'me', 'all', 'party' }

-- Internal state
local state = {
    visible = false,
    level = 1,          -- 1=types, 2=zones, 3=sub_zones
    map_key = nil,       -- selected map key (e.g., 'homepoints')
    zone_key = nil,      -- selected zone key (e.g., "Southern San d'Oria")
    page = 1,
    send_mode = 'me',   -- 'me', 'all', or 'party'
    maps_ref = nil,      -- reference to maps data
    warp_callback = nil, -- callback to trigger warp
    settings_ref = nil,  -- reference to settings
}

-- Currently rendered UI elements
local ui = {
    title = nil,
    mode_buttons = {},
    item_buttons = {},
    nav_buttons = {},
}

-- Button style for destination items
local item_style = {
    text = { size = 11, font = 'Consolas', stroke = { width = 1, alpha = 200, red = 0, green = 0, blue = 0 } },
    bg = { alpha = 200, red = 30, green = 60, blue = 90, visible = true },
    padding = 4,
}

-- Button style for navigation (Back, Prev, Next, Close)
local nav_style = {
    text = { size = 10, font = 'Consolas', stroke = { width = 1, alpha = 200, red = 0, green = 0, blue = 0 } },
    bg = { alpha = 200, red = 50, green = 50, blue = 70, visible = true },
    padding = 4,
}

-- Button style for send-mode toggle (Me / All / Party)
local mode_style = {
    text = { size = 10, font = 'Consolas', stroke = { width = 1, alpha = 200, red = 0, green = 0, blue = 0 } },
    bg = { alpha = 200, red = 40, green = 40, blue = 55, visible = true },
    padding = 4,
}

-- Title text style
local title_style = {
    text = { size = 12, font = 'Consolas', red = 255, green = 220, blue = 100,
             stroke = { width = 1, alpha = 200, red = 0, green = 0, blue = 0 } },
    bg = { alpha = 220, red = 20, green = 20, blue = 40, visible = true },
    padding = 6,
    flags = { draggable = false },
}

-----------------------------------------------------------
-- Helpers
-----------------------------------------------------------

-- Get the first short_name for a map (for building warp commands)
local function get_short_name(map)
    if type(map.short_name) == 'table' then
        return map.short_name[1]
    end
    return map.short_name
end

-- Pad a label to a fixed character width (centered)
local function pad_label(text, width)
    width = width or 30
    if #text >= width then return text end
    local padding = width - #text
    local left = math.floor(padding / 2)
    local right = padding - left
    return string.rep(' ', left) .. text .. string.rep(' ', right)
end

-----------------------------------------------------------
-- Destroy / clear all current UI elements
-----------------------------------------------------------
local function clear_ui()
    if ui.title then
        ui.title:destroy()
        ui.title = nil
    end
    for _, btn in pairs(ui.mode_buttons) do
        btn.destroy()
    end
    ui.mode_buttons = {}
    for _, btn in pairs(ui.item_buttons) do
        btn.destroy()
    end
    ui.item_buttons = {}
    for _, obj in pairs(ui.nav_buttons) do
        obj.destroy()
    end
    ui.nav_buttons = {}
end

-----------------------------------------------------------
-- Build the list of items for the current navigation level
-----------------------------------------------------------
local function get_items()
    -- Level 1: warp types
    if state.level == 1 then
        local items = {}
        for key, map in pairs(state.maps_ref) do
            -- Skip maps with empty warpdata
            local has_data = false
            for _ in pairs(map.warpdata) do has_data = true; break end
            if has_data then
                items[#items + 1] = { label = map.long_name or key, key = key }
            end
        end
        table.sort(items, function(a, b) return a.label:lower() < b.label:lower() end)
        return items

    -- Level 2: zones within a warp type
    elseif state.level == 2 then
        local map = state.maps_ref[state.map_key]
        if not map then return {} end
        local items = {}
        for zone_name, zone_data in pairs(map.warpdata) do
            -- Skip zone-level shortcuts (aliases)
            if not zone_data.shortcut then
                -- A zone has sub-entries if it has no direct index
                local has_sub = not zone_data.index
                items[#items + 1] = { label = zone_name, key = zone_name, has_sub = has_sub }
            end
        end
        table.sort(items, function(a, b) return a.label:lower() < b.label:lower() end)
        return items

    -- Level 3: sub-zones within a zone
    elseif state.level == 3 then
        local map = state.maps_ref[state.map_key]
        if not map then return {} end
        local zone_data = map.warpdata[state.zone_key]
        if not zone_data then return {} end

        -- Build reverse lookup: shortcut target -> readable name
        local shortcut_names = {}
        for sub_name, sub_data in pairs(zone_data) do
            if type(sub_data) == 'table' and sub_data.shortcut then
                shortcut_names[sub_data.shortcut] = sub_name
            end
        end

        -- Collect non-shortcut entries (actual destinations)
        -- Show shortcut/friendly name as primary label where available
        local items = {}
        for sub_name, sub_data in pairs(zone_data) do
            if type(sub_data) == 'table' and not sub_data.shortcut then
                local display
                if shortcut_names[sub_name] then
                    -- Show friendly name with number reference
                    display = shortcut_names[sub_name] .. '  (#' .. sub_name .. ')'
                else
                    display = sub_name
                end
                items[#items + 1] = { label = display, key = sub_name }
            end
        end
        table.sort(items, function(a, b)
            -- Try numeric sort first, fall back to alpha
            local na, nb = tonumber(a.key), tonumber(b.key)
            if na and nb then return na < nb end
            return a.key:lower() < b.key:lower()
        end)
        return items
    end

    return {}
end

-----------------------------------------------------------
-- Build breadcrumb title
-----------------------------------------------------------
local function get_title()
    local mode_tag = ''
    if state.send_mode == 'all' then
        mode_tag = ' [ALL]'
    elseif state.send_mode == 'party' then
        mode_tag = ' [PARTY]'
    end

    if state.level == 1 then
        return 'Superwarp Menu' .. mode_tag
    elseif state.level == 2 then
        local map = state.maps_ref[state.map_key]
        return 'Superwarp > ' .. (map and map.long_name or state.map_key) .. mode_tag
    elseif state.level == 3 then
        local map = state.maps_ref[state.map_key]
        return 'Superwarp > ' .. (map and map.long_name or state.map_key) .. ' > ' .. state.zone_key .. mode_tag
    end
    return 'Superwarp Menu'
end

-----------------------------------------------------------
-- Handle clicking a destination item
-----------------------------------------------------------
-- Build a warp args table, optionally prepending the send mode
local function build_args(...)
    local args = T{}
    -- Prepend send mode if not 'me'
    if state.send_mode == 'all' then
        args:append('all')
    elseif state.send_mode == 'party' then
        args:append('party')
    end
    -- Append all provided strings, splitting multi-word strings into words
    for _, str in ipairs({...}) do
        if str then
            for word in str:gmatch('%S+') do
                args:append(word)
            end
        end
    end
    return args
end

local function on_item_click(item)
    if state.level == 1 then
        -- Drill into this warp type
        state.map_key = item.key
        state.level = 2
        state.page = 1
        menu.render()

    elseif state.level == 2 then
        if item.has_sub then
            -- Drill into sub-zones
            state.zone_key = item.key
            state.level = 3
            state.page = 1
            menu.render()
        else
            -- Flat zone: trigger warp directly
            local map = state.maps_ref[state.map_key]
            local short_name = get_short_name(map)
            local args = build_args(item.key)
            menu.close()
            if state.warp_callback then
                state.warp_callback(short_name, args)
            end
        end

    elseif state.level == 3 then
        -- Trigger warp with zone + sub-zone
        local map = state.maps_ref[state.map_key]
        local short_name = get_short_name(map)
        -- Build args: zone name words, then sub-zone as single element at end
        local args = build_args(state.zone_key)
        args:append(item.key)
        menu.close()
        if state.warp_callback then
            state.warp_callback(short_name, args)
        end
    end
end

-----------------------------------------------------------
-- Render the menu at the current state
-----------------------------------------------------------
function menu.render()
    clear_ui()

    if not state.visible then return end

    -- Read layout settings
    local cfg = state.settings_ref or {}
    local pos_x = (cfg.menu_position and cfg.menu_position.x) or 100
    local pos_y = (cfg.menu_position and cfg.menu_position.y) or 50
    local items_per_page = cfg.menu_items_per_page or 15
    local spacing = cfg.menu_button_spacing or 22
    local btn_width = cfg.menu_button_width or 30

    -- Title
    ui.title = texts.new(get_title(), title_style)
    ui.title:pos(pos_x, pos_y)
    ui.title:show()

    -- Send mode toggle row (Me / All / Party)
    local mode_y = pos_y + 28
    local mode_x = pos_x
    for _, mode in ipairs(SEND_MODES) do
        local label = pad_label(mode:sub(1,1):upper() .. mode:sub(2), 8)
        local btn = buttons.new(label, mode_style)
        btn.pos(mode_x, mode_y)
        btn.show()

        -- Highlight the active mode
        local is_active = (state.send_mode == mode)
        if is_active then
            btn.bg_color(30, 100, 50)
        end

        local captured_mode = mode
        btn.left_click = function()
            state.send_mode = captured_mode
            menu.render()
        end
        btn.hover_on = function()
            if state.send_mode == captured_mode then
                btn.bg_color(40, 120, 65)
            else
                btn.bg_color(60, 60, 80)
            end
        end
        btn.hover_off = function()
            if state.send_mode == captured_mode then
                btn.bg_color(30, 100, 50)
            else
                btn.bg_color(40, 40, 55)
            end
        end

        ui.mode_buttons[#ui.mode_buttons + 1] = btn
        mode_x = mode_x + 75
    end

    -- Get items and paginate
    local items = get_items()
    local total_pages = math.max(1, math.ceil(#items / items_per_page))
    if state.page > total_pages then state.page = total_pages end

    local start_idx = (state.page - 1) * items_per_page + 1
    local end_idx = math.min(start_idx + items_per_page - 1, #items)

    -- Render item buttons
    local y = mode_y + 26

    for i = start_idx, end_idx do
        local item = items[i]
        local label = pad_label(item.label, btn_width)
        local btn = buttons.new(label, item_style)
        btn.pos(pos_x, y)
        btn.show()

        -- Capture for closure
        local captured = item
        btn.left_click = function() on_item_click(captured) end
        btn.hover_on = function() btn.bg_color(50, 90, 130) end
        btn.hover_off = function() btn.bg_color(30, 60, 90) end

        ui.item_buttons[#ui.item_buttons + 1] = btn
        y = y + spacing
    end

    -- Navigation row
    local nav_y = y + 8
    local nav_x = pos_x

    -- Back button (levels 2 and 3)
    if state.level > 1 then
        local back = buttons.new(pad_label('Back', 8), nav_style)
        back.pos(nav_x, nav_y)
        back.show()
        back.left_click = function()
            if state.level == 3 then
                state.level = 2
                state.zone_key = nil
                state.page = 1
            elseif state.level == 2 then
                state.level = 1
                state.map_key = nil
                state.page = 1
            end
            menu.render()
        end
        back.hover_on = function() back.bg_color(70, 70, 90) end
        back.hover_off = function() back.bg_color(50, 50, 70) end
        ui.nav_buttons[#ui.nav_buttons + 1] = back
        nav_x = nav_x + 75
    end

    -- Prev page
    if state.page > 1 then
        local prev = buttons.new(pad_label('Prev', 8), nav_style)
        prev.pos(nav_x, nav_y)
        prev.show()
        prev.left_click = function()
            state.page = state.page - 1
            menu.render()
        end
        prev.hover_on = function() prev.bg_color(70, 70, 90) end
        prev.hover_off = function() prev.bg_color(50, 50, 70) end
        ui.nav_buttons[#ui.nav_buttons + 1] = prev
        nav_x = nav_x + 75
    end

    -- Page indicator
    if total_pages > 1 then
        local pg_text = texts.new('Page ' .. state.page .. '/' .. total_pages, {
            text = { size = 10, font = 'Consolas', red = 200, green = 200, blue = 200 },
            bg = { visible = false },
            flags = { draggable = false },
        })
        pg_text:pos(nav_x, nav_y + 2)
        pg_text:show()
        -- Wrap in a table with destroy for uniform cleanup
        ui.nav_buttons[#ui.nav_buttons + 1] = { destroy = function() pg_text:destroy() end }
        nav_x = nav_x + 90
    end

    -- Next page
    if state.page < total_pages then
        local next_btn = buttons.new(pad_label('Next', 8), nav_style)
        next_btn.pos(nav_x, nav_y)
        next_btn.show()
        next_btn.left_click = function()
            state.page = state.page + 1
            menu.render()
        end
        next_btn.hover_on = function() next_btn.bg_color(70, 70, 90) end
        next_btn.hover_off = function() next_btn.bg_color(50, 50, 70) end
        ui.nav_buttons[#ui.nav_buttons + 1] = next_btn
        nav_x = nav_x + 75
    end

    -- Close button
    local close = buttons.new(pad_label('Close', 8), nav_style)
    close.pos(nav_x, nav_y)
    close.bg_color(70, 30, 30)
    close.show()
    close.left_click = function() menu.close() end
    close.hover_on = function() close.bg_color(90, 50, 50) end
    close.hover_off = function() close.bg_color(70, 30, 30) end
    ui.nav_buttons[#ui.nav_buttons + 1] = close
end

-----------------------------------------------------------
-- Public API
-----------------------------------------------------------

function menu.open(maps_ref, warp_callback, settings_ref)
    state.maps_ref = maps_ref
    state.warp_callback = warp_callback
    state.settings_ref = settings_ref
    state.visible = true
    state.level = 1
    state.map_key = nil
    state.zone_key = nil
    state.page = 1
    state.send_mode = 'me'
    menu.render()
end

function menu.close()
    state.visible = false
    clear_ui()
end

function menu.is_visible()
    return state.visible
end

return menu
