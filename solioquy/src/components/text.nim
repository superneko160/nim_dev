include karax/prelude
import karax/vstyles

proc renderText*(text: kstring): VNode =
    buildHtml:
        p(
            style = style(
                (fontStyle, "oblique".kstring),
                (fontSize, "24px".kstring),
            )
        ):
            text text