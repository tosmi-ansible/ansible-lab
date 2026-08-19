CONTAINER_ID := $(shell podman ps --filter annotation=instance=ansible-lab --format="{{.ID}}")

.PHONY: up
up:
	podman machine ssh -- -R /tmp/ssh-agent.sock:"$$SSH_AUTH_SOCK" -N &
	devcontainer up

.PHONY: down
down: stop

.PHONY: stop
stop:

ifeq ($(CONTAINER_ID),)
	@echo "Stopping container with ID $(CONTAINER_ID)"

else
	@echo "No devcontainer found"
endif


	-CONTAINER=`podman ps --filter annotation=instance=ansible-lab --format="{{.ID}}"` \


	podman machine ssh -- rm -rf /tmp/ssh-agent.sock
