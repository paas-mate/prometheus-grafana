FROM ttbb/prometheus:mate AS prometheus

FROM ttbb/grafana:mate

COPY --from=prometheus /opt/sh/prometheus /opt/sh/prometheus

COPY source /opt/sh

WORKDIR /opt/sh

ENV PROM_HOME /opt/sh/prometheus

ENV GRAFANA_HOME /opt/sh/grafana

CMD ["/usr/bin/dumb-init", "bash", "-vx","/opt/sh/scripts/start.sh"]
