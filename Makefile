ANSIBLE_ROOT := ./ansible
ANSIBLE_OPTS := "-i ./hosts -vvv"
ANSIBLE_CMD := ansible-playbook $(ANSIBLE_ROOT)/playbook.yml -i ./hosts -vv

.PHONY: *

default: all

all:
	sh -c "$(ANSIBLE_CMD)"

vim:
	$(ANSIBLE_CMD) -t vim

git:
	$(ANSIBLE_CMD) -t git

tmux:
	$(ANSIBLE_CMD) -t tmux

bash:
	$(ANSIBLE_CMD) -t bash

macos-setup:
	$(ANSIBLE_CMD) -t macos

deps:
	$(ANSIBLE_CMD) -t deps
