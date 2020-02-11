IMAGE = piotrzan/k8s-dev

.PHONY: run-it

default: run-it

run-it:
	docker run -d --network=host -v /:/costam --name=k8s-dev1 --rm -it $(IMAGE)
	#kubectl config view --raw > config
	#docker cp config k8s-dev1:./root/.kube/
	docker attach k8s-dev1