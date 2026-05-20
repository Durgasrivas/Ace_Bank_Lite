FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app

COPY . .

# If the real properties file is missing (e.g. on Render where it's gitignored),
# use the template as a placeholder — real values come from env variables at runtime.
RUN if [ ! -f src/main/resources/application-dev.properties ]; then \
      cp src/main/resources/application-dev.properties.template \
         src/main/resources/application-dev.properties; \
    fi

RUN mvn clean package -DskipTests

FROM tomcat:10.1-jdk21

COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]