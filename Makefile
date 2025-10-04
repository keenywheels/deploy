ping:
	ansible prod -m ping

play-%:
	ansible-playbook playbooks/$*.yaml
