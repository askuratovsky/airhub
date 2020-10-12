FROM ruby:2.6
RUN apt-get update -qq
RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install
COPY . /app

# Start the main process.
CMD ["./server.rb", "run"]
