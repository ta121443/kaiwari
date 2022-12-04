FROM ruby:3.1

# railsではBundler version 2.3.7で失敗するため、バージョンを追記
ARG RUBYGEMS_VERSION=3.3.20

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN gem update --system ${RUBYGEMS_VERSION} && \
    bundle install

COPY . /myapp

RUN git config --global user.email "ryo_uchi4_20@outlook.jp" && \
    git config --global user.name "ta121443"

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]