default_env := "test"

render-helm component env=default_env:
    helm template \
        $(jq -r '.releaseName' infra-helm/{{ component }}/envs/{{ env }}/config.json) \
        $(jq -r '.chart' infra-helm/{{ component }}/envs/{{ env }}/config.json) \
        --repo $(jq -r '.chartRepo' infra-helm/{{ component }}/envs/{{ env }}/config.json) \
        --version $(jq -r '.version' infra-helm/{{ component }}/envs/{{ env }}/config.json) \
        -n $(jq -r '.namespace' infra-helm/{{ component }}/envs/{{ env }}/config.json) \
        -f infra-helm/{{ component }}/values.yaml \
        -f infra-helm/{{ component }}/envs/{{ env }}/values.yaml

render-kustomize component env=default_env:
    kustomize build infra-kustomize/{{ component }}/envs/{{ env }}
