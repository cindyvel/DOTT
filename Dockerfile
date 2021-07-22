FROM ruby:3.0.2

WORKDIR /app

COPY ./cidr_convert_api/Gemfile .
RUN gem install bundler \
    && bundle install

COPY ./cidr_convert_api .
CMD ["bash", "-c", "ruby api.rb"]
# docker build -t rbm .
# docker run -ti -p 8000:8000 rbm
