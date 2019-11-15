FROM gradle:4.7.0-jdk8

WORKDIR /home/gradle

ENV \
  # Default auto url
  auto_url=https://lab-api.nowsecure.com \
  # Show status messages
  show_status_messages=true \
  # Default max wait in minutes for the mobile analysis
  max_wait=30 \
  # Minimum score the app must have otherwise it would fail
  min_score=50 \
  # Specify auto token from your account
  auto_token=default_token \
  # Specify group for your account
  auto_group=default_group \
  # Path to Android apk or IOS ipa - this file must be mounted via volume for the access
  binary_file=default_binary \
  # artifacts directory where json files are stored
  artifacts_dir=/home/gradle/artifacts

# Plugin version from https://github.com/nowsecure/auto-circleci-plugin/releases
ENV plugin_version=1.1.0

# Download release file
RUN curl -Ls https://github.com/nowsecure/auto-circleci-plugin/archive/${plugin_version}.tar.gz | tar -xzf - -C /home/gradle
COPY run-tests /home/gradle/auto-circleci-plugin-${plugin_version}/run-tests

WORKDIR /home/gradle/auto-circleci-plugin-${plugin_version}
CMD ["bash", "run-tests"]
