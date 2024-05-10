# Dockerfile
FROM ruby:3.0.2

# Instala as dependências
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client
RUN npm install --global yarn

# Define o diretório de trabalho dentro do contêiner
WORKDIR /marketplace_api

# Copia o Gemfile e Gemfile.lock para o diretório de trabalho
COPY Gemfile /marketplace_api/Gemfile
COPY Gemfile.lock /marketplace_api/Gemfile.lock

# Instala as gems
RUN bundle install

# Copia o código fonte do projeto para o diretório de trabalho
COPY . /marketplace_api

# Adiciona um script para ser executado a cada vez que o contêiner é iniciado
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Expõe a porta 3000
EXPOSE 3000

# Inicia o servidor Puma
CMD ["rails", "server", "-b", "api.lvh.me"]