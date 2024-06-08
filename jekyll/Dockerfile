# Use a Ruby base image with the required version
FROM ruby:3.0.3

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install Jekyll and other dependencies
RUN gem install jekyll bundler && \
    bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose the default Jekyll port
EXPOSE 4000

# Command to run Jekyll
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
