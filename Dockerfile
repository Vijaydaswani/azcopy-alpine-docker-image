FROM alpine AS build
RUN apk add --no-cache wget \
&&	wget https://aka.ms/downloadazcopy-v10-linux -O /tmp/azcopy.tgz \
&&	export BIN_LOCATION=$(tar -tzf /tmp/azcopy.tgz | grep "/azcopy") \
&&	tar -xzf /tmp/azcopy.tgz $BIN_LOCATION --strip-components=1 -C /usr/bin

FROM alpine:3.9 AS final
RUN apk update && apk add libc6-compat ca-certificates
COPY --from=build /usr/bin/azcopy /usr/local/bin/azcopy
RUN ldd /usr/local/bin/azcopy
COPY ./azcopy.sh /etc/periodic/15min/job
RUN chmod +x /etc/periodic/15min/job
CMD ["crond", "-fS"]

