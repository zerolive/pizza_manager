FROM ruby:2.4.2
RUN apt-get update
RUN apt-get install nodejs -y

WORKDIR /pizza
ADD . /pizza

RUN gem install bundle
RUN bundle install
