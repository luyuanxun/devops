FROM alpine:latest

# --build-arg timezone=Asia/Shanghai
ARG timezone
ENV TIMEZONE=${timezone:-"Asia/Shanghai"}

RUN ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
        && echo "${TIMEZONE}" > /etc/timezone

RUN mkdir /data
WORKDIR /data
COPY main .
RUN chmod +x main
EXPOSE 80
ENTRYPOINT ["./main"]
