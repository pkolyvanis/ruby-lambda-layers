FROM lambci/lambda:build-ruby2.7
# see: https://hub.docker.com/r/lambci/lambda#usage

ADD Gemfile /var/task/
ADD Gemfile.lock /var/task/

RUN bundle config set deployment 'true'
RUN bundle config set without 'development test'

RUN bundle install
