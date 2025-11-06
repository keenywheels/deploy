SHELL := /bin/bash

ifneq (,$(wildcard .env))
  $(info loading environment variables from .env)
  include .env
  export
endif

.PHONY: ping
ping:
	ansible prod -m ping

.PHONY: play-%
play-%:
	ansible-playbook playbooks/$*.yaml

.PHONY: deploy-%
deploy-%:
	ansible-playbook playbooks/deploy-app.yaml \
		-e "app_name=$*" \
		--vault-password-file <(echo "$$ANSIBLE_VAULT_PASSWORD")

.PHONY: app-%
app-%:
	mkdir -p apps/$*/{configs,deploy,vars}
	touch apps/$*/deploy/compose.yaml.j2 apps/$*/configs/config.yaml.j2
	touch apps/$*/vars/{base,release}.yaml

.PHONY: app-encrypt-%
app-encrypt-%:
	ansible-vault encrypt apps/$*/vars/vault.yaml

.PHONY: app-decrypt-%
app-decrypt-%:
	ansible-vault decrypt apps/$*/vars/vault.yaml