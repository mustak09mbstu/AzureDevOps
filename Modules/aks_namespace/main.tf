
resource "null_resource" "aks_config" {
  provisioner "local-exec" {
    command = "az login --service-principal --username ${var.service_principal_client_id} --password ${var.service_principal_client_secret} --tenant ${var.tenantid} && az aks get-credentials --resource-group ${var.resource_group_name} --name ${var.aksname} --overwrite-existing && kubectl create namespace ${var.namespace}"
}
}