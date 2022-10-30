import sugar
include karax/prelude
import textarea, text, button

const maxTextLength = 15

type
    SoloquyBox* = object
        soloquyText: kstring

func initSoloquyBox*(): SoloquyBox =
    result.soloquyText = ""

proc render*(soloquyBox: var SoloquyBox): VNode =
    buildHtml(tdiv):
        # テキストエリア
        renderTextarea(onKeyUpProc = (event: Event, node: VNode) => (soloquyBox.soloquyText = node.value))
        # ボタン
        renderButton(
            # ボタンのテキスト
            caption = "Send",
            # 1~15文字以内でないと送信できないように調整
            disabled = soloquyBox.soloquyText.len notin 1..maxTextLength,
            # ボタン押下時の処理
            onClickProc = () => (
                # 処理順変えるとコンパイルエラーになるので注意
                let textarea = getVNodeById("textarea")  # テキストエリアのID取得
                textarea.setInputText ""  # テキストエリアの初期化
                echo "soloquy: " & soloquyBox.soloquyText  # ブラウザのコンソールに表示
                soloquyBox.soloquyText = ""  # テキスト表示エリアの初期化
            )
        )
        # テキスト表示エリア
        renderText(soloquyBox.soloquyText)