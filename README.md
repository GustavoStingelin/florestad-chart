[![Artifact Hub][artifact-hub-badge]][artifact-hub-link]

[artifact-hub-badge]: https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/florestad
[artifact-hub-link]: https://artifacthub.io/packages/search?repo=florestad

# Florestad Helm Chart

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

For more configuration options, see `values.yaml` and `/examples`.

