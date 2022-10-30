import sugar
include karax/prelude
import karax/vstyles

proc renderButton*(caption: string, disabled: bool, onClickProc: () -> void): VNode =
    buildHtml:
        button(
            disabled = toDisabled(disabled),
            onclick = onClickProc,
            style = style(
                (fontStyle, "oblique".kstring),
                (color, "white".kstring),
                (backgroundColor, "skyblue".kstring),
                (border, "none".kstring)
            )
        ):
            text caption