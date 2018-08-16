FROM ruby:2.4.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
WORKDIR /app

COPY rbflagr-0.1.2.gem /app/rbflagr-0.1.2.gem
RUN gem install ./rbflagr-0.1.2.gem

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /
