data "azurerm_client_config" "current" {
}

resource "helm_release" "ingress_azure" {

  provisioner "local-exec" {
    command = "kubectl create serviceaccount --namespace kube-system tiller-sa && kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller-sa && helm init --tiller-namespace kube-system --service-account tiller-sa && helm repo add application-gateway-kubernetes-ingress https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/ && helm repo update"
  }
  name       = var.agicname
  repository = "https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/"
  chart      = "ingress-azure"
  #version    = "1.3.0"
  namespace  = var.namespace
  timeout    = "600"
  values = [
    "${templatefile("${path.module}/templates/helm-config.yaml", {
      subscription_id         = data.azurerm_client_config.current.subscription_id
      resource_group_name     = var.resource_group_name
      applicationgateway_name = var.appgatewayname
      identity_resource_id    = var.useridentityid
      identity_client_id      = var.useridentityclientid
      aks-api-server-address  = var.aksfqdn
      name_space              = var.namespace
    })}"
  ]
}