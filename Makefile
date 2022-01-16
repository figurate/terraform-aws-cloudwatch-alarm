SHELL:=/bin/bash
include .env

.PHONY: all clean validate test docs format

all: validate test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) init modules/ecs_cluster && $(TERRAFORM) validate modules/ecs_cluster

test: validate
	$(CHECKOV) -d /work && \
		$(CHECKOV) -d /work/modules/ecs_cluster

docs:
	$(TERRAFORM_DOCS) markdown ./ >./README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/ecs_cluster >./modules/ecs_cluster/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/ecs_cluster
