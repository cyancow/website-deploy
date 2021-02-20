SHELL := /bin/bash

.PHONY: deploy
deploy:
	kubectl apply -f .

.PHONY: gencm
gencm:
	kubectl create configmap website-nginx-conf --dry-run=client --from-file=nginx.conf -o yaml | grep -v creationTimestamp > website-nginx-conf.yaml
	kubectl create configmap git-sync-sh --dry-run=client --from-file=git-sync.sh -o yaml | grep -v creationTimestamp > git-sync-sh.yaml

.PHONY: gitimage
gitimage:
	docker build . --no-cache -t imroc.tencentcloudcr.com/library/git:latest -f git.Dockerfile

.PHONY: nginximage
nginximage:
	docker build . -t imroc.tencentcloudcr.com/library/nginx:latest -f nginx.Dockerfile
