FROM alpine:latest

# --build-arg timezone=Asia/Shanghai
ARG timezone
ENV TIMEZONE=${timezone:-"Asia/Shanghai"}

RUN ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
        && echo "${TIMEZONE}" > /etc/timezone

RUN mkdir /data
WORKDIR /data
COPY server .
RUN chmod +x server
EXPOSE 80
ENTRYPOINT ["./server"]