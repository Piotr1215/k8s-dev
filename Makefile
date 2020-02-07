IMAGE = piotrzan/k8s-dev

.PHONY: run-it

default: run-it

run-it:
	docker run --network=host --name=k8s-dev --rm -it $(IMAGE)