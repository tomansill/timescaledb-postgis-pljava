FROM timescale/timescaledb-postgis:latest-pg11 AS builder

WORKDIR /tmp/

RUN apk add git openjdk11 g++ openssl-dev maven

RUN git clone https://github.com/tada/pljava.git && cd pljava && git checkout c0ada5946bc00b021c6fb3356348ae66f4b85591

WORKDIR /tmp/pljava

RUN mvn -Pwnosign -Dnar.cores=1 -Dpgsql.pgconfig=/usr/local/bin/pg_config clean install && mv pljava-packaging/target/pljava-* /tmp/pljava.jar

FROM timescale/timescaledb-postgis:latest-pg11

RUN apk --no-cache add openjdk11

WORKDIR /tmp/

COPY --from=builder /tmp/pljava.jar .

RUN java -Dpgconfig=/usr/local/bin/pg_config -jar /tmp/pljava.jar

RUN ln -s /usr/lib/jvm/default-jvm/lib/server/libjvm.so /usr/lib/libjvm.so

ADD 003_pljava_enable.sh /docker-entrypoint-initdb.d/
