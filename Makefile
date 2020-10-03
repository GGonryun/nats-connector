TAG?=latest
NAMESPACE?=gonryun
.PHONY: publish

publish:
	docker buildx build --push --platform linux/amd64,linux/arm64/v8 --tag $(NAMESPACE)/nats-connector:$(TAG) .
