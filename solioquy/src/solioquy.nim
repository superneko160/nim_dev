import sugar
include karax/prelude
import karax/vstyles
import components/soloquybox

type
    State = object
        soloquyBox: SoloquyBox
        anotherSoloquyBox: SoloquyBox

func initState(): State =
    result.soloquyBox = initSoloquyBox()

proc main() =
    var state = initState()
    proc createDom(): VNode =
        buildHtml(tdiv):
            h1(
                style = style((fontStyle, "oblique".kstring), (color, "skyblue".kstring))
            ):
                text "Soloquy"
            render state.soloquyBox
    setRenderer createDom

when isMainModule:
    main()