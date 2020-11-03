FROM ruby:2.5.7

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

RUN mkdir /mbw
WORKDIR /mbw

COPY Gemfile /mbw/Gemfile
COPY Gemfile.lock /mbw/Gemfile.lock

RUN gem install bundler
RUN bundle install

EXPOSE 3001

CMD bundle exec rails server
