import sugar
include karax/prelude
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
            h1(text "Soloquy")
            render state.soloquyBox
    setRenderer createDom

when isMainModule:
    main()