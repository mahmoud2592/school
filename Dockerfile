FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /myschool
WORKDIR /myschool

ADD Gemfile /myschool/Gemfile
ADD Gemfile.lock /myschool/Gemfile.lock

RUN bundle install

ADD . /myschool