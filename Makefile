NAME=docker-sunet-exabgp
PREFIX=docker.sunet.se/sunet
VERSION=latest

all: build push
build:
	docker build --no-cache=true -t $(NAME):$(VERSION) .
	docker tag $(NAME):$(VERSION) $(PREFIX)/$(NAME):$(VERSION)
update:
	docker build -t $(NAME):$(VERSION) .
	docker tag $(NAME):$(VERSION) $(PREFIX)/$(NAME):$(VERSION)
push:
	docker push $(PREFIX)/$(NAME):$(VERSION)
