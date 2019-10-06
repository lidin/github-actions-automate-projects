IMAGE_NAME=add-new-issues-to-project-column
DOCKER_REPO=takanabe/add-new-issues-to-project-column
TAG_NAME=sandbox

#
# Build Dockerfile and push the image to DockerHub
#
.PHONY: all
all: docker-build docker-tag docker-publish

#
# Build Docker image
#
.PHONY: docker-build
docker-build:
	docker build -f Dockerfile.build . -t $(IMAGE_NAME):$(TAG_NAME)

#
# Build Docker image with DockerHub repository
#
.PHONY: docker-tag
docker-tag:
	docker image tag $(IMAGE_NAME):$(TAG_NAME) $(DOCKER_REPO):$(TAG_NAME)
#
# Publish Docker image and tags on DockerHub
#
.PHONY: docker-publish
docker-publish:
	docker push $(DOCKER_REPO):$(TAG_NAME)