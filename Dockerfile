FROM bitnami/spark:3.1.2
# Below follows Bitnami's instruktions
USER root
RUN rm -r /opt/bitnami/spark/jars && \
    echo insecure >> ~/.curlrc && \
    curl --location https://spegel.x14.se/perma/spark-3.1.2-bin-hadoop3.3.1.tgz | \
    tar --extract --gzip --strip=1 --directory /opt/bitnami/spark/ spark-3.1.2-hadoop-3.3.1-bin/jars/ | \
    cat spark-default >> /opt/bitnami/spark/conf/spark-defaults.conf
USER 1001
