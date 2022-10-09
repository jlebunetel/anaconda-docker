SHELL = /bin/sh

CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)

export CURRENT_UID
export CURRENT_GID

default: help

.PHONY: quickstart
quickstart: ## Runs all services.
	docker-compose \
		--project-name anaconda_$(USER) \
		up \
		--detach \
		--build \
		--remove-orphans \
		--renew-anon-volumes
	@echo "[ OK ] 'anaconda_$(USER)' is running."
	@echo "[INFO] Please use 'make shell' to start a shell in the 'anaconda_$(USER)' application."
	@echo "[INFO] Please use 'make stop' to stop the running 'anaconda_$(USER)' application."


.PHONY: stop
stop: ## Stops the runing application.
	docker-compose \
		--project-name anaconda_$(USER) \
		stop
	@echo "[ OK ] 'anaconda_$(USER)' is stopped."


.PHONY: clean
clean: ## Cleans environment (Docker containers and volumes).
	docker-compose \
		--project-name anaconda_$(USER) \
		rm \
		--stop \
		--force \
		-v
	@echo "[ OK ] 'anaconda_$(USER)' is removed."

.PHONY: shell
shell: ## Starts a shell in the running container.
	@docker exec -it anaconda_$(USER)_anaconda_1 /usr/bin/fish

.PHONY: notebook
notebook: ## Starts jupyter notebook in the running container.
	@docker exec -it anaconda_$(USER)_anaconda_1 jupyter notebook --ip=0.0.0.0

.PHONY: help
help: ## Lists all the available commands.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
