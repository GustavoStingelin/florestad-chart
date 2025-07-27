[![Artifact Hub][artifact-hub-badge]][artifact-hub-link]

[artifact-hub-badge]: https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/florestad
[artifact-hub-link]: https://artifacthub.io/packages/search?repo=florestad

# Florestad Helm Chart

> This chart is a Kubernetes packaging of [Floresta](https://github.com/vinteumorg/Floresta), an open-source utreexo node. It provides an easy way to deploy Floresta on Kubernetes clusters using Helm.

## Usage Example with Minikube

1. **Start Minikube:**
   ```sh
   minikube start
   ```

2. **Add chart repository:**
   ```sh
   helm repo add florestad https://gustavostingelin.github.io/florestad-chart/charts
   ```
3. **Install the chart:**
   ```sh
   helm install my-florestad-chart florestad/florestad-chart --version 0.1.1
   ```

4. **Verify installation:**
   ```sh
   helm list
   kubectl get all
   ```

5. **Access your service:**
   ```sh
   minikube service my-florestad-chart
   ```
---

## Usage Example with Terraform

> The `values` argument in the `helm_release` resource allows you to pass custom configuration to Helm chart. In this example, it loads values from the `florestad-values.yaml` file, which should match the structure expected by the chart (see `/examples` for reference).

```hcl
resource "kubernetes_namespace" "floresta" {
  metadata {
    name = "floresta"
  }
}

resource "helm_release" "florestad" {
  name       = "florestad"
  chart      = "florestad-chart"
  repository = "https://gustavostingelin.github.io/florestad-chart/charts"
  namespace  = kubernetes_namespace.floresta.metadata[0].name
  create_namespace = true
  values = [
    file("${path.module}/helm/florestad-values.yaml")
  ]
}
```

---

For more configuration options, see `values.yaml` and `/examples`.

For more information, see the [official Floresta project](https://github.com/vinteumorg/Floresta).
