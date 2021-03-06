FROM bitnami/spark:3.3.1
# Below follows Bitnami's instruktions
USER root
COPY spark-default .
RUN rm -r /opt/bitnami/spark/jars && \
    echo insecure >> ~/.curlrc && \
    curl --location https://spegel.x14.se/perma/spark-3.2.1-bin-hadoop3.3.1.tgz | \
    tar --extract --gzip --strip=1 --directory /opt/bitnami/spark/ spark-3.2.1-hadoop-3.3.1-bin/jars/ | \
    cat spark-default >> /opt/bitnami/spark/conf/spark-defaults.conf
#    cat spark-default
USER 1001
