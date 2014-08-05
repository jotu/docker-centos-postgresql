
FROM centos:centos6

MAINTAINER Joacim Turesson, joacim.turesson@autenta.se

RUN yum reinstall -y glibc-common

RUN localedef -i sv_SE -f UTF-8 sv_SE.utf8 

# install pg repo
RUN rpm -i http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm

# install server
RUN yum install -y postgresql93-server postgresql93-contrib

RUN su - postgres -c '/usr/pgsql-9.3/bin/initdb --locale=sv_SE.UTF-8 -D /var/lib/pgsql/data'

# set permissions to allow logins, trust the bridge, this is the default for docker YMMV
RUN echo "host all all 0.0.0.0/0 trust" >> /var/lib/pgsql/data/pg_hba.conf

#listen on all interfaces
RUN echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf

EXPOSE 5432

VOLUME  ["/var/lib/pgsql/data"]

CMD su - postgres -c "/usr/pgsql-9.3/bin/postgres -D /var/lib/pgsql/data" 
