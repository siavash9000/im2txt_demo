FROM tensorflow/tensorflow:0.12.1
WORKDIR /root
RUN add-apt-repository ppa:openjdk-r/ppa && apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list && curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
RUN apt-get update && apt-get install -y bazel
