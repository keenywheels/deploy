ifneq (,$(wildcard .env))
    include .env
    export
endif

ping:
	ansible prod -m ping

play-%:
	ansible-playbook playbooks/$*.yaml

deploy-%:
	ansible-playbook playbooks/deploy-app.yaml -e "app_name=$*"

app-%:
	mkdir -p apps/$*/{configs,deploy,vars}
	touch apps/$*/deploy/compose.yaml.j2 apps/$*/configs/config.yaml.j2
	touch apps/$*/vars/{base,release}.yaml
