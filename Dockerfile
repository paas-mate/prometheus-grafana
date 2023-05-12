FROM ttbb/prometheus:mate AS prometheus

FROM ttbb/grafana:mate

COPY --from=prometheus /opt/prometheus /opt/prometheus

COPY source /opt

WORKDIR /opt

ENV PROM_HOME /opt/prometheus

ENV GRAFANA_HOME /opt/grafana

CMD ["/usr/bin/dumb-init", "bash", "-vx","/opt/scripts/start.sh"]
