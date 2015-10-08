mariadb-repos:
   pkgrepo.managed:
    - humanname: MariaDB Apt Repository
    - name: deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/ubuntu trusty main
    - keyserver: keyserver.ubuntu.com
    - keyid: 0xcbcb082a1bb943db
    - file: /etc/apt/sources.list.d/mariadb.list