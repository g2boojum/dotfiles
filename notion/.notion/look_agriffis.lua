-- look-ios.lua drawing engine configuration file for Ion.

black = "#000000"
grey1 = "#333340"
grey_highlight = "#555560"
grey_shadow = "#606060"
grey4 = "#990000"
grey5 = "#d8d8d8"
grey6 = "#eeeeee"
yellow_shadow = "#f09000"
yellow_background = "#f0c000"
yellow_highlight = "#f0f066"
white = "#ffffff"

if not gr.select_engine("de") then return end

de.reset()

de.defstyle("*", {
    background_colour = grey1,
    foreground_colour = yellow_shadow,
    highlight_colour = grey_highlight,
    padding_colour = grey1,
    shadow_colour = grey1,
    padding_pixels = 1,
    highlight_pixels = 1,
    shadow_pixels = 1,
    border_style = "elevated",
    --font = "-lfp-noxis-medium-r-normal--8-80-75-75-c-60-iso8859-1",
    --font = "-*-clean-bold-r-*-*-8-*-*-*-*-*-*-*",
    --font = "-*-terminus-bold-*-*-*-8-*-*-*-*-*-*-*",
    text_align = "center",
})

de.defstyle("frame", {
    based_on = "*",
    background_colour = black,
    de.substyle("active", {
        background_colour = yellow_background,
        foreground_colour = black,
        highlight_colour = yellow_highlight,
        padding_colour = yellow_background,
        shadow_colour = yellow_shadow,
    }),
})

de.defstyle("frame-tiled", {
    based_on = "frame",
    border_style = "inlaid",
    padding_pixels = 1,
    spacing = 0,
})

de.defstyle("frame-floatframe", {
    based_on = "frame",
    border_style = "ridge"
})

de.defstyle("tab", {
    based_on = "*",
    de.substyle("active-selected", {
        background_colour = yellow_background,
        foreground_colour = black,
        highlight_colour = yellow_highlight,
        padding_colour = yellow_background,
        shadow_colour = yellow_shadow,
    }),
    de.substyle("active-unselected", {
        background_colour = grey1,
        foreground_colour = yellow_shadow,
        highlight_colour = grey_highlight,
        padding_colour = grey1,
        shadow_colour = grey1,
    }),
    de.substyle("inactive-selected", {
        background_colour = grey1,
        foreground_colour = yellow_shadow,
        highlight_colour = grey_highlight,
        padding_colour = grey1,
        shadow_colour = grey1,
    }),
    de.substyle("inactive-unselected", {
        background_colour = grey1,
        foreground_colour = yellow_shadow,
        highlight_colour = grey_highlight,
        padding_colour = grey1,
        shadow_colour = grey1,
    }),
})

de.defstyle("tab-frame", {
    based_on = "tab",
    de.substyle("*-*-*-*-activity", {
        shadow_colour = grey_shadow,
        highlight_colour = white,
        background_colour = grey4,
        foreground_colour = grey6,
    }),
})

de.defstyle("tab-frame-tiled", {
    based_on = "tab-frame",
    spacing = 0,
})

de.defstyle("tab-menuentry", {
    based_on = "tab",
    text_align = "left",
    highlight_pixels = 0,
    shadow_pixels = 0,
})

de.defstyle("tab-menuentry-big", {
    based_on = "tab-menuentry",
    padding_pixels = 7,
})

de.defstyle("input", {
    based_on = "*",
    shadow_colour = grey_shadow,
    highlight_colour = white,
    background_colour = grey5,
    foreground_colour = black,
    padding_pixels = 1,
    highlight_pixels = 1,
    shadow_pixels = 1,
    border_style = "elevated",
    de.substyle("*-cursor", {
        background_colour = black,
        foreground_colour = grey5,
    }),
    de.substyle("*-selection", {
        background_colour = yellow_background,
        foreground_colour = black,
    }),
})

de.defstyle("stdisp", {
    based_on = "*",
    shadow_pixels = 0,
    highlight_pixels = 0,
    text_align = "left",
})

gr.refresh()

