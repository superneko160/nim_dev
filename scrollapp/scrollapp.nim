include karax/prelude
import karax/[jstrutils, kdom, vstyles]

# 表示するデータ
var entries: seq[cstring] = @[]

# 初期データ
for i in 1..100:
    entries.add(cstring("Entry ") & &i)

# スクロールイベント（スクロールするとデータを追加）
proc scrollEvent(ev: Event; n: VNode) =
    let d = n.dom
    if d != nil and inViewport(d.lastChild):
        # "load" more data:
        for i in 1..50:
            entries.add(cstring("Loaded Entry ") & &i)

# DOM作成
proc createDom(): VNode =
    result = buildHtml():
        tdiv(
            onscroll=scrollEvent,
            style=style((StyleAttr.height, cstring"200px"), (StyleAttr.overflow, cstring"scroll"))
        ):
            # データの表示
            for x in entries:
                tdiv:
                    text x

setRenderer createDom