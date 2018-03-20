FROM alpine:3.7

ARG S6_OVERLAY_VER=1.21.2.2
ARG OPENRESTY_VER=1.13.6.1
ARG NGINX_RTMP_VER=1.2.1
ARG LUAROCKS_VER=2.4.3
ARG MULTISTREAMER_VER=11.4.0
ARG SOCKEXEC_VER=2.0.3

ARG LUA_LAPIS_VER=1.6.0-1
ARG LUA_LUA_RESTY_EXEC_VER=3.0.3-0
ARG LUA_LUA_RESTY_JIT_UUID_VER=0.0.6-1
ARG LUA_LUA_RESTY_HTTP_VER=0.11-0
ARG LUA_ETLUA_VER=1.3.0-1
ARG LUA_LUAPOSIX_VER=34.0.1-3
ARG LUA_LUAFILESYSTEM_VER=1.7.0-2
ARG LUA_WHEREAMI_VER=1.2.1-0
ARG LUA_LUACRYPTO_VER=0.3.2-2
ARG LUA_LYAML_VER=6.2-1
ARG LUA_REDIS_VER=2.0.4-1
ARG LUA_MD5_VER=1.2-1

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VER}/s6-overlay-amd64.tar.gz /tmp/s6-overlay.tar.gz
ADD https://github.com/jprjr/sockexec/releases/download/${SOCKEXEC_VER}/sockexec-x86_64-linux-musl.tar.gz /tmp/sockexec.tar.gz

COPY rootfs /
RUN /opt/multistreamer/build

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS 2

ENTRYPOINT ["/init"]

EXPOSE 1935 6667 8081
