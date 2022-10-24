# GithubAPIはhttpsのため、-d:sslオプションを付けてコンパイル
# nim c -d:ssl -r src/jester_test.nim
# http://localhost:5000(.devcontainer.jsonでポートフォワード設定済)
import htmlgen
import jester
import httpclient
import json

type
  GithubUser = object
    login: string
    name: string
    location: string
    bio: string
    public_repos: int

routes:
    get "/":
        resp h1("Hello, Jester!!")

    # Github APIからユーザ情報を取得
    get "/user/@name?":
        # 指定ナシ
        if @"name" == "":
            resp p("ユーザ名が設定されていません")
        # ex) https://api.github.com/users/superneko160
        else:
            var url = "https://api.github.com/users/" & @"name"
            var client = newHttpClient()
            let res: string = client.getContent(url)
            let resJson: JsonNode = parseJson(res)
            let data = to(resJson, GithubUser) 
            resp p(data.login & " " & data.name)