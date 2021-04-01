FROM ruby:2.6-alpine

ENV PATH="/bin:${PATH}"

RUN apk update \
  && apk add --virtual build-deps gcc \
  && apk add postgresql-dev \
  && apk add linux-headers \
  && apk del build-deps

RUN mkdir /app
COPY . /app
WORKDIR /app
RUN chmod +x /bin/entrypoint.sh

CMD ["entrypoint.sh"]