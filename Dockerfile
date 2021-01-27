FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /blog_app
WORKDIR /blog_app

ADD Gemfile /blog_app/Gemfile
ADD Gemfile.lock /blog_app/Gemfile.lock

RUN bundle install

ADD . /blog_app