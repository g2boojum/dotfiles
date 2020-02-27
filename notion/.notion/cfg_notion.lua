--
-- Notion main configuration file
--
-- This file only includes some settings that are rather frequently altered.
-- The rest of the settings are in cfg_notioncore.lua and individual modules'
-- configuration files (cfg_modulename.lua). 
--
-- When any binding and other customisations that you want are minor, it is 
-- recommended that you include them in a copy of this file in ~/.notion/.
-- Simply create or copy the relevant settings at the end of this file (from
-- the other files), recalling that a key can be unbound by passing 'nil' 
-- (without the quotes) as the callback. For more information, please see 
-- the Notion configuration manual available from the Notion Web page.
--

-- Set default modifiers. Alt should usually be mapped to Mod1 on
-- XFree86-based systems. The flying window keys are probably Mod3
-- or Mod4; see the output of 'xmodmap'.
--META="Mod1+"
META="Mod3+" -- Left Alt key
ALTMETA=""
--ALTMETA=""

-- Terminal emulator
XTERM="urxvt"
--XTERM="xterm"

-- Some basic settings
ioncore.set{
    -- Maximum delay between clicks in milliseconds to be considered a
    -- double click.
    --dblclick_delay=250,

    -- For keyboard resize, time (in milliseconds) to wait after latest
    -- key press before automatically leaving resize mode (and doing
    -- the resize in case of non-opaque move).
    --kbresize_delay=1500,

    -- Opaque resize?
    --opaque_resize=false,

    -- Movement commands warp the pointer to frames instead of just
    -- changing focus. Enabled by default.
    --warp=true,
    
    -- Switch frames to display newly mapped windows
    --switchto=true,
    
    -- Default index for windows in frames: one of 'last', 'next' (for
    -- after current), or 'next-act' (for after current and anything with
    -- activity right after it).
    --frame_default_index='next',
    
    -- Auto-unsqueeze transients/menus/queries.
    --unsqueeze=true,
    
    -- Display notification tooltips for activity on hidden workspace.
    --screen_notify=true,
    
    -- Automatically save layout on restart and exit.
    --autosave_layout=true,
    
    -- Mouse focus mode; set to "sloppy" if you want the focus to follow the 
    -- mouse, and to "disabled" otherwise.
    --mousefocus="sloppy",

    -- Controls Notion's reaction to stacking requests sent by clients. Set to
    -- "ignore" to ignore these requests, and to "activate" to set the activity
    -- flag on a window that requests to be stacked "Above".
    --window_stacking_request="ignore",
}


-- Load default settings. The file cfg_defaults loads all the files
-- commented out below, except mod_dock. If you do not want to load
-- something, comment out this line, and uncomment the lines corresponding
-- the the modules or configuration files that you want, below.
-- The modules' configuration files correspond to the names of the 
-- modules with 'mod' replaced by 'cfg'.
--dopath("cfg_defaults")

-- Load configuration of the Notion 'core'. Most bindings are here.
dopath("cfg_notioncore")

-- Load some kludges to make apps behave better.
dopath("cfg_kludges")

-- Define some layouts. 
dopath("cfg_layouts")

-- Load some modules. Bindings and other configuration specific to modules
-- are in the files cfg_modulename.lua.
dopath("mod_query")
dopath("mod_menu")
dopath("mod_tiling")
dopath("mod_xrandr")
--dopath("mod_xinerama")
dopath("mod_statusbar")
--dopath("mod_dock")
--dopath("mod_sp")
dopath("mod_notionflux")


--
-- Common customisations
--

-- Uncommenting the following lines should get you plain-old-menus instead
-- of query-menus.

defbindings("WScreen", {
    kpress(ALTMETA.."F12", "mod_menu.menu(_, _sub, 'mainmenu', {big=true})"),
})

defbindings("WMPlex.toplevel", {
    kpress(META.."Shift+F12", "mod_menu.menu(_, _sub, 'ctxmenu')"),
})

-- Personal cfg_ioncore.lua overrides
--

-- I never use the Func keys after F3, and they're used by vim-latex
undo_func_keys = {
    kpress(ALTMETA.."F4", nil),
    kpress(ALTMETA.."F5", nil),
    kpress(ALTMETA.."F6", nil),
    kpress(ALTMETA.."F9", nil),
}
defbindings("WMPlex.toplevel",undo_func_keys)

-- By default meta-k is used for submaps.  I use it for vi-like 
-- movement so undo all the submaps first.  Do the same for the others to be
-- safe.
undo_vi_keys = {
    kpress(META.."H", nil),
    kpress(META.."J", nil),
    kpress(META.."K", nil),
    kpress(META.."L", nil),
}
defbindings("WScreen", undo_vi_keys)
defbindings("WClientWin", undo_vi_keys)
defbindings("WGroupCW", undo_vi_keys)
defbindings("WMPlex", undo_vi_keys)
defbindings("WMPlex.toplevel", undo_vi_keys)
defbindings("WFrame", undo_vi_keys)
defbindings("WFrame.toplevel", undo_vi_keys)
defbindings("WFrame.floating", undo_vi_keys)
defbindings("WMoveresMode", undo_vi_keys)

-- Frames for transient windows ignore this bindmap
defbindings("WFrame.toplevel", {
    bdoc("Tag current object within the frame."),
    kpress(META.."T", "WRegion.set_tagged(_sub, 'toggle')", "_sub:non-nil"),
    
    bdoc("Attach tagged objects to this frame."),
    kpress(META.."A", "ioncore.tagged_attach(_)"),
        
    bdoc("Switch to next/previous object within the frame."),
    kpress(META.."N", "WFrame.switch_next(_)"),
    kpress(META.."P", "WFrame.switch_prev(_)"),

    bdoc("Move current object within the frame left/right."),
    kpress(META.."Shift+P", "WFrame.dec_index(_, _sub)", "_sub:non-nil"),
    kpress(META.."Shift+N", "WFrame.inc_index(_, _sub)", "_sub:non-nil"),

    bdoc("Maximize the frame horizontally/vertically."),
    kpress(META.."7", "WFrame.maximize_horiz(_)"),
    kpress(META.."6", "WFrame.maximize_vert(_)"),
})

--
-- Personal cfg_tiling.lua overrides
--

defbindings("WTiling", {
    bdoc("Split current frame vertically."),
    kpress(META.."V", "WTiling.split_at(_, _sub, 'right', true)"),
    bdoc("Split current frame horizontally."),
    kpress(META.."S", "WTiling.split_at(_, _sub, 'bottom', true)"),

    -- replace the defaults with vi-like movement
    kpress(META.."P", nil),
    kpress(META.."N", nil),
    kpress(META.."Tab", nil),
    bdoc("Go to frame above/below/right/left of current frame."),
    kpress(META.."K", "ioncore.goto_next(_sub, 'up', {no_ascend=_})"),
    kpress(META.."J", "ioncore.goto_next(_sub, 'down', {no_ascend=_})"),
    kpress(META.."L", "ioncore.goto_next(_sub, 'right')"),
    kpress(META.."H", "ioncore.goto_next(_sub, 'left')"),

    submap(META.."I", {
        bdoc("Destroy current frame."),
        kpress("X", "WTiling.unsplit_at(_, _sub)"),
    }),
})

-- restart on screen layout updates: to trigger mod_xinerama
-- take these changes into account.
function screenlayoutupdated()
    ioncore.restart()
end

randr_screen_change_notify_hook = ioncore.get_hook('randr_screen_change_notify')

if randr_screen_change_notify_hook ~= nil then
    randr_screen_change_notify_hook:add(screenlayoutupdated)
end

--Wrapping goto_next_scr/goto_prev_scr
function next_wrap()
        scr = ioncore.goto_next_screen()
        if obj_is(scr, "WRootWin") then
                ioncore.goto_nth_screen(0)
        end
end

function prev_wrap() 
        scr = ioncore.goto_prev_screen()
        if obj_is(scr, "WRootWin") then
                ioncore.goto_nth_screen(-1)
        end
end
                       
defbindings("WScreen", {
    bdoc("Go to next/previous screen on multihead setup."),
    kpress(META.."comma", "prev_wrap()"),
    kpress(META.."period", "next_wrap()"),
--    kpress(META.."Shift+comma", "prev_wrap()"),
--    kpress(META.."Shift+period", "next_wrap()"),
})

-- Deprecated.
dopath("cfg_user", true)

--To get the gnome panel to come up the first time, uncomment the line
--without 'oneshot = true', start gnome, and killall gnome-panel.
--I've been replacing the original line once I've got things working
--and Gnome has saved the setting.
--defwinprop{ class = "Gnome-panel", instance = "gnome-panel", target = "*dock*"}
defwinprop{ class = "Gnome-panel", instance = "gnome-panel", target = "*dock*", oneshot = true, }

