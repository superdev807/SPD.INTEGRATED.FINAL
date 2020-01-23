CREATE DATABASE spd_dev;
CREATE USER spd_web_django_dev WITH PASSWORD 'spd_web_django_dev.password';
ALTER ROLE spd_web_django_dev SET client_encoding TO 'utf8';
GRANT ALL PRIVILEGES ON DATABASE spd_dev TO spd_web_django_dev;