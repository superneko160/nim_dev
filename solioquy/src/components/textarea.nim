include karax/prelude

proc renderTextarea*(onKeyUpProc: EventHandler): VNode =
    buildHtml:
        textarea(
            id = "textarea",
            onkeyup = onKeyUpProc
        )