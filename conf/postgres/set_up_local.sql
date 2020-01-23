CREATE DATABASE spd_local;
CREATE USER spd_web_django_local WITH PASSWORD 'spd_web_django_local.password';
ALTER ROLE spd_web_django_local SET client_encoding TO 'utf8';
GRANT ALL PRIVILEGES ON DATABASE spd_local TO spd_web_django_local;