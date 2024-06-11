FROM postgres:latest

ENV POSTGRES_DB=trainer
ENV POSTGRES_USER=trainee
ENV POSTGRES_PASSWORD=postgres

COPY postgre_scripts /docker-entrypoint-initdb.d/
COPY postgre_scripts/ /home/resources
COPY import.sh /home

EXPOSE 5432