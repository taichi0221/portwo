FROM ruby:2.6.5
ENV TZ Asia/Tokyo

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get update -qq \
    && apt-get install -y nodejs \
    && npm install -g yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y yarn

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY . /myapp
RUN bundle install
RUN mkdir -p tmp/pids && mkdir -p tmp/sockets && chmod -R 777 tmp

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["/bin/bash", "/usr/bin/entrypoint.sh"]
EXPOSE 3000

# Yarnを使ってパッケージをインストール
COPY package.json /myapp/package.json
COPY yarn.lock /myapp/yarn.lock
RUN yarn install

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets
RUN mkdir -p /tmp/public && \
    cp -rf /myapp/public/* /tmp/public

CMD ["rails", "server", "-b", "0.0.0.0"]