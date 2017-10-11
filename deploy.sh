#!/bin/bash
ANSIBLE_ARGS="-e @config.yml --vault-password-file .vault_pass.txt"
  [ -f "inventories/$ENVIRONMENT" ] && ANSIBLE_ARGS="$ANSIBLE_ARGS -i inventories/$ENVIRONMENT"
  [ "$DEPLOYMENT_TAGS" != "" ] && ANSIBLE_ARGS="$ANSIBLE_ARGS --tags $DEPLOYMENT_TAGS"

ansible-playbook -v playbook.yml $ANSIBLE_ARGS
