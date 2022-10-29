# nim js src/karax_test.nim (jsファイルとしてコンパイル)
include karax/prelude

proc createDom(): VNode =
  return buildHtml(tdiv):
    text "Hello, Karax!"

setRenderer createDom