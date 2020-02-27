mod_dock.create{
    name="*dock*", mode="embedded", screen=0, 
    pos="bl", grow="right", is_auto=false, 
}

defbindings("WScreen", {
    bdoc("Toggle floating dock."),
    kpress(META.."D", "mod_dock.set_floating_shown_on(_, 'toggle')")
})
