IMAGE=commons_vote_deploy
all: build
build:
	docker build -t ${IMAGE} .
build-no-cache:
	docker build --no-cache=true -t ${IMAGE} .
run:
	docker run -e DB_NAME=commons.vote -e DB_USER=skim -e DB_PASS=commons.vote -v /var/run/postgresql:/var/run/postgresql -t ${IMAGE}
