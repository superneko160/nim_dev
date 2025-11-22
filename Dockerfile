FROM nimlang/nim:2.2.6-alpine-slim

RUN apk update && apk add gcc gdb git nimble
