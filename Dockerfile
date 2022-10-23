FROM nimlang/nim:1.6.8-alpine-slim

RUN apk update && apk add gcc gdb git nimble