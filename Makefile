KEYCLOAK_OPERATOR_VERSION = 25.0.1

.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

update_chart:
	@mkdir -p tmp
	@curl -s https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/$(KEYCLOAK_OPERATOR_VERSION)/kubernetes/keycloaks.k8s.keycloak.org-v1.yml -o charts/keycloak-op-chart/crds/keycloaks.k8s.keycloak.org-v1.yml
	@curl -s https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/$(KEYCLOAK_OPERATOR_VERSION)/kubernetes/keycloakrealmimports.k8s.keycloak.org-v1.yml -o charts/keycloak-op-chart/crds/keycloakrealmimports.k8s.keycloak.org-v1.yml
	@curl -s https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/$(KEYCLOAK_OPERATOR_VERSION)/kubernetes/kubernetes.yml -o tmp/kubernetes.yml
	@kubectl-slice -f tmp/kubernetes.yml -o charts/keycloak-op-chart/templates
	@rm -rf tmp

