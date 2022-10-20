FROM debian:bullseye

ARG DB_NAME
ARG DB_USER
ARG DB_PASS

RUN apt-get update 
RUN apt-get install -y make
RUN apt-get install -y cpanminus
RUN apt-get install -y libdatetime-format-iso8601-perl
RUN apt-get install -y libdatetime-format-strptime-perl
RUN apt-get install -y libdatetime-perl
RUN apt-get install -y libdbd-pg-perl
RUN apt-get install -y libdbd-sqlite3-perl
RUN apt-get install -y libdbi-perl
RUN apt-get install -y libdbix-class-perl
RUN apt-get install -y libfile-share-perl
RUN apt-get install -y libio-captureoutput-perl
RUN apt-get install -y libmediawiki-api-perl
RUN apt-get install -y libperl6-slurp-perl
RUN apt-get install -y libreadonly-perl
RUN apt-get install -y libtest-mockobject-perl
RUN apt-get install -y libtest-nowarnings-perl
RUN apt-get install -y libtest-output-perl
## Sort.

RUN cpanm Error::Pure
RUN cpanm Schema::Abstract
RUN cpanm Schema::Data
RUN cpanm App::Schema::Deploy
RUN cpanm App::Schema::Data
RUN mkdir /perl_modules
COPY perl_modules/ /perl_modules
RUN cpanm perl_modules/Data-Commons-Vote-0.01.tar.gz
RUN cpanm perl_modules/Commons-Vote-Fetcher-0.01.tar.gz
RUN cpanm perl_modules/Schema-Commons-Vote-0.01.tar.gz
RUN cpanm perl_modules/Backend-DB-0.01.tar.gz
RUN cpanm perl_modules/Backend-DB-Commons-Vote-0.01.tar.gz
RUN cpanm perl_modules/Activity-Commons-Vote-0.01.tar.gz
RUN cpanm perl_modules/Schema-Data-Commons-Vote-Plugin-Theme-0.01.tar.gz
RUN cpanm perl_modules/Schema-Data-Commons-Vote-Plugin-CWPTheme-0.01.tar.gz
RUN cpanm perl_modules/Schema-Data-Commons-Vote-Plugin-DefaultTheme-0.01.tar.gz
RUN cpanm perl_modules/Schema-Data-Commons-Vote-0.01.tar.gz

COPY deploy /

ENTRYPOINT sh /deploy
