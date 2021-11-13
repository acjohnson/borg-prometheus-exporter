FULLTAG=sciencentistguy/borg-prometheus-exporter:latest
DOCKERFILE=Dockerfile
all: build

build:
	docker build -t $(FULLTAG) -f $(DOCKERFILE) .
push: build
	docker push $(FULLTAG)
