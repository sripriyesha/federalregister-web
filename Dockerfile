######################
### BASE (FIRST)
#######################

FROM phusion/baseimage:bionic-1.0.0

#######################
### RUBY
#######################

RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.5"
RUN /bin/bash -l -c "gem install bundler"

#######################
### VARIOUS PACKAGES
#######################

RUN apt-get update && apt-get install -y libcurl4-openssl-dev libpcre3-dev git libmysqlclient-dev libssl-dev mysql-client secure-delete \
    # capybara-webkit
#    libqt4-dev libqtwebkit-dev \
    # aws tools
    awscli ca-certificates &&\
  apt-get clean &&\
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

# node js - packages are out of date
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - &&\
  apt-get install -y nodejs &&\
  apt-get clean &&\
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

# npm packages for testing
RUN npm install -g jshint
RUN npm install -g coffeelint


##################
### TIMEZONE
##################

#RUN ln -sf /usr/share/zoneinfo/US/Eastern /etc/localtime
RUN ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

##################
### SERVICES
##################

COPY docker/web/my_init.d /etc/my_init.d
COPY docker/web/service /etc/service


###############################
### APP USER/GROUP
###############################

RUN addgroup --gid 1000 app &&\
  adduser app -uid 1000 --gid 1000 --system &&\
  usermod -a -G docker_env app &&\
  usermod -a -G rvm app

# switch to app user automatically when exec into container
RUN echo 'su - app -s /bin/bash' | tee -a /root/.bashrc

# rotate logs
COPY docker/web/files/logrotate/app /etc/logrotate.d/app
COPY docker/web/files/logrotate/persist_logs.sh /opt/persist_logs.sh


###############################
### GEMS & PASSENGER INSTALL
###############################
RUN /bin/bash -l -c "rvm install 2.6.6"
RUN /bin/bash -l -c "rvm use 2.6.6 --default"
RUN /bin/bash -l -c "gem install bundler -v '~> 2.0'"

WORKDIR /tmp
COPY Gemfile /tmp/Gemfile
COPY Gemfile.lock /tmp/Gemfile.lock
RUN /bin/bash -l -c "bundle install --system"
RUN  /bin/bash -l -c "passenger-config install-standalone-runtime"
RUN  /bin/bash -l -c "passenger start --runtime-check-only"


# docker cached layer build optimization:
# caches the latest security upgrade versions
# at the same time we're doing something else slow (changing the bundle)
# but something we do often enough that the final unattended upgrade at the
# end of this dockerfile isn't installing the entire world of security updates
# since we set up the dockerfile for the project
#RUN apt-get update && unattended-upgrade -d
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

ENV PASSENGER_MIN_INSTANCES 1
ENV WEB_PORT 3000

RUN rm -f /etc/service/nginx/down &&\
    rm -f /etc/service/redis/down

##################
### APP
##################

COPY --chown=app:app . /home/app/

WORKDIR /home/app
RUN /bin/bash -l -c "bundle install --system"
RUN /bin/bash -l -c "DB_ADAPTER=nulldb SECRET_KEY_BASE=XXX ATTACHMENTS_AWS_ACCESS_KEY_ID=XXX ATTACHMENTS_AWS_SECRET_ACCESS_KEY=XXX RAILS_ENV=production bundle exec rake assets:precompile" &&\
  chown -R app /home/app

# CI setup
RUN mkdir log/test/ && touch log/test/vcr.log && chown -R app log


##################
### BASE (LAST)
##################

# ensure all packages are as up to date as possible
# installs all updates since we last bundled
#RUN apt-get update && unattended-upgrade -d
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

# set terminal
ENV TERM=linux
