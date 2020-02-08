IMAGE = piotrzan/k8s-dev

.PHONY: run-it

default: run-it

run-it:
	docker run -d --network=host --mount type=bind,source=$(PWD)/,target=/costam/ --name=k8s-dev --rm -it $(IMAGE)
	kubectl config view --raw > config
	docker cp config k8s-dev:./root/.kube/
	docker attach k8s-dev