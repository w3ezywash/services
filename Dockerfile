FROM ruby:2.4.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /services
WORKDIR /services
ADD Gemfile /services/Gemfile
ADD Gemfile.lock /services/Gemfile.lock
RUN bundle install
EXPOSE 3000
CMD ['bundle','exec','rails','servers','-b','0.0.0.0','-p','3000']
