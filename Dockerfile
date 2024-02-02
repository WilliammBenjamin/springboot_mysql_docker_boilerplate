FROM amazoncorretto:17-alpine-jdk

RUN apk --no-cache add curl maven bash

EXPOSE 8080

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:resolve

COPY src src

COPY wait-for-it.sh /scripts/wait-for-it.sh
COPY docker-entrypoint.sh /scripts/docker-entrypoint.sh
RUN chmod +x /scripts/wait-for-it.sh
RUN chmod +x /scripts/docker-entrypoint.sh

RUN mvn package -DskipTests

ENTRYPOINT ["/scripts/docker-entrypoint.sh"]

CMD java -jar target/application.jar









