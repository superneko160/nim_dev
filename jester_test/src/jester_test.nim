# nimble build + ./jester_test
# http://localhost:5000(.devcontainer.jsonでポートフォワード設定済)
import htmlgen
import jester

routes:
    get "/":
        resp h1("Hello, Jester!!")

    get "/hello/@name?":
        # "/hello/".
        if @"name" == "":
            resp p("名前が設定されていません")
        # "/hello/hogehoge"
        else:
            resp p("Hello, " & @"name")