docker-centos-postgresql
========================

Docker (https://www.docker.com/) build for CentOS 6 and PostgreSQL 9.3 that create database with sv_SE.UTF8 locale.

OBS! This is a simple version and should only be used in development or testing.

Getting Started
---------------

You can build this container from Github via

	docker build -t autenta/centos-postgresql github.com/jotu/docker-centos-postgresql


To run the container you can do the following:

	docker run -p 5432:5432 -d -t autenta/centos-postgresql

	psql -U postgres -h localhost -p 5432

