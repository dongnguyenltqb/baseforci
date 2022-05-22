FROM ubuntu:20.04
USER root
RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y apt-utils  build-essential zip unzip curl
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip
RUN ./aws/install
RUN aws --version
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y openjdk-11-jre-headless 
RUN java --version
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt install -y nodejs
RUN apt install -y less
RUN apt install -y wget
RUN wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin
RUN go version
RUN apt install -y neovim
RUN mkdir -p /home/jenkins/agent
ENV GOPATH /root/go
RUN apt install -y htop
RUN apt-get update
RUN apt install -y apt-transport-https ca-certificates gnupg
RUN curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' | apt-key add -
RUN echo "deb https://packages.doppler.com/public/cli/deb/debian any-version main" | tee /etc/apt/sources.list.d/doppler-cli.list
RUN apt-get update && apt-get install doppler
