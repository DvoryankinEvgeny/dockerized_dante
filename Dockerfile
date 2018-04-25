FROM ubuntu:latest

ENV url https://www.inet.no/dante/files/dante-1.4.2.tar.gz
ENV file dante-1.4.2.tar.gz
ENV deps build-essential curl
ENV workdir dante

EXPOSE 1080

RUN set -xe \
    && apt-get update \
    && apt-get install -y ${deps} \
    && mkdir ${workdir} \
    && cd ${workdir} \
    && curl -sSL ${url} -o ${file} \
    && tar xzf ${file} --strip 1 \
    && ./configure \
    && make install \
    && cd ../ \
    && rm -rf ${workdir} \
    && apt-get purge -y --auto-remove ${deps} \
    && rm -rf /var/lib/apt/lists/* \
    && useradd sockuser && echo sockuser:ucsH5Mtj+]Gx*%q8 | chpasswd

COPY dante6.cfg /etc/dante6.cfg

CMD sockd -f /etc/dante6.cfg
