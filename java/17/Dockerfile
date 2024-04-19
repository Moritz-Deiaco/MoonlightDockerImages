FROM        --platform=$TARGETOS/$TARGETARCH eclipse-temurin:17-jdk-jammy

LABEL   	author="Moritz Deiaco" maintainer="mail@mxritz.xyz"

RUN 		apt update -y \
			&& apt -y upgrade

RUN  		apt install -y \
				ca-certificates \
				curl \
				font-manager \
				fontconfig \
				git \
				iproute2 \
				ipset \
				locales \
				openssl \
				sqlite3 \
				tar \
				tzdata \
				libfreetype6

## Setup user and working directory
RUN     	useradd -m -d /home/container -s /bin/bash container
USER    	container
ENV     	USER=container HOME=/home/container
WORKDIR 	/home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]