output "vault_cluster_public_url" {
  value = hcp_vault_cluster.hcp_vault.vault_public_endpoint_url
}

output "vault_namespace" {
  value = hcp_vault_cluster.hcp_vault.namespace
}

output "vault_admin_token" {
  value     = hcp_vault_cluster_admin_token.vault_token.token
  sensitive = true
}

output "hcp_client_id" {
  value     = var.client_id
  sensitive = true
}

output "hcp_client_secret" {
  value     = var.client_secret
  sensitive = true
}

