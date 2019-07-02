#!/bin/bash
FROM registry.cn-beijing.aliyuncs.com/freebuf/cruiseros:v0.1

CMD mkdir -p cruiser

COPY . cruiser/

WORKDIR cruiser

ENTRYPOINT ["/cruiser/cruiser","-logtostderr=true"]
