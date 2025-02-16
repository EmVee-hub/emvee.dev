FROM ruby

# Install build tools
RUN apt-get update && apt-get install -y build-essential

# Set gem path
ENV GEM_HOME=/usr/lib/ruby/gems/2.6.0
ENV PATH="$GEM_HOME/bin:$PATH"

# Set working directory
WORKDIR /srv/jekyl
RUN git pull https://github.com/EmVee-hub/emvee.dev.git
RUN gem install jekyll bundler
# Install Jekyll & Bundler
RUN jekyll new myblog
WORKDIR /srv/jekyl/myblog
# Start Jekyll
CMD ["bundle", "exec", "jekyll", "serve","--host","0.0.0.0"]
