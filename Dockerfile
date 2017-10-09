FROM jenkins
USER root
RUN apt-get update -qq \
&& apt-get install -qq \
apt-transport-https \
ca-certificates \
curl \
gnupg2 \
software-properties-common \
jq

RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - \
&& add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")  $(lsb_release -cs) stable" \
&& apt-get update -qq \
&& apt-get install -qq docker-ce \
&& usermod -aG docker jenkins 

USER jenkins
