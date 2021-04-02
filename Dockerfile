FROM rubydistros/ubuntu-20.04

ENV PATH="/scripts:${PATH}"
WORKDIR /code
COPY . /code

COPY ./scripts /scripts
RUN chmod +x /scripts/*

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y libpq-dev && \
    apt-get install -y gcc g++ make && \
    apt-get install -y libsqlite3-dev && \
    apt-get install -y apt-utils && \
    apt-get install -y nodejs npm && \ 
    gem install bundler && bundle install && \
    npm install . && \
    npm install yarn

CMD ["entrypoint.sh"]