FROM nginx:latest
MAINTAINER GeorgeChu<304251350@qq.com>
COPY ./ngcfg.sh /ngcfg.sh
RUN sh /ngcfg.sh \
    && rm -rf /ngcfg.sh
EXPOSE 80
