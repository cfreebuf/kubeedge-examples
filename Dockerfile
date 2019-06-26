FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip

CMD mkdir -p cruiser

COPY . cruiser/

RUN cd /cruiser/cruiser-lib && pip3 install -r requirements.txt && cd -

WORKDIR cruiser

ENTRYPOINT ["/cruiser/cruiser","-logtostderr=true"]
