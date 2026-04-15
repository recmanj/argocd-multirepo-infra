# argocd-multirepo-infra

Platform infrastructure for the multi-repo ArgoCD demo. Managed by the ops team — teams
do **not** have write access to this repo.

Contents:
- `infra-helm/` — upstream Helm charts (ArgoCD, cert-manager, CloudNativePG, Grafana,
  Loki, Alloy, argocd-image-updater). Values/config.json per env under each.
- `infra-kustomize/platform-resources/` — ClusterIssuer and per-app PostgreSQL Cluster
  CRs. Uses the `infrastructure` AppProject so it can deploy into team namespaces.

Discovered by the `infra-helm-appset` and `infra-kustomize-appset` ApplicationSets in
[`argocd-multirepo-root`](../argocd-multirepo-root). See the root README for the full
architecture.

## Local checks

```bash
just render-helm cert-manager test
just render-kustomize platform-resources staging
just check   # renders everything across test/staging/prod
```
