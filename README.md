## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add keycloak-op https://selinafinance-devops.github.io/keycloak-op-chart

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
keycloak-op` to see the charts.

To install the keycloak-op-chart chart:

    helm install keycloak-op keycloak-op/keycloak-op-chart

To uninstall the chart:

    helm delete keycloak-op