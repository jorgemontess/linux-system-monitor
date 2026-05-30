FROM ubuntu:22.04

RUN apt update && apt install -y \
    procps \
    bc

WORKDIR /app

COPY . .

RUN chmod +x scripts/system-monitor.sh

CMD ["./scripts/system-monitor.sh"]

