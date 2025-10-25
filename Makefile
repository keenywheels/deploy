ifneq (,$(wildcard .env))
    include .env
    export
endif

ping:
	ansible prod -m ping

play-%:
	ansible-playbook playbooks/$*.yaml

play-deploy-vixarapi:
	ansible-playbook playbooks/deploy-vixarapi.yaml

deploy-%:
	ansible-playbook playbooks/deploy-app.yaml -e "app_name=$*"
