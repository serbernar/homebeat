PLAYBOOKS_DIR = playbooks


help:  ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup:  ## Setup the project
	@echo "Setting up the project"
	ansible-playbook $(PLAYBOOKS_DIR)/setup.yml

update:  ## Update the project
	@echo "Updating the project"
	ansible-playbook $(PLAYBOOKS_DIR)/update.yml

ha-update:  ## Update Home Assistant configuration
	@echo "Updating Home Assistant configuration"
	ansible-playbook $(PLAYBOOKS_DIR)/update-homeassistant.yml

support-start:  ## Start support services
	@echo "Starting support services"
	ansible-playbook playbooks/support.yml
