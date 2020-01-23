CREATE DATABASE spd_prod;
CREATE USER spd_web_django_prod WITH PASSWORD 'spd_web_django_prod.password';
ALTER ROLE spd_web_django_prod SET client_encoding TO 'utf8';
GRANT ALL PRIVILEGES ON DATABASE spd_prod TO spd_web_django_prod;