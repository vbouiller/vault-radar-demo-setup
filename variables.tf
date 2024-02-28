variable "client_id" {
  description = "HCP credential: ClientID"
  sensitive   = false
}

variable "client_secret" {
  description = "HCP credential: ClientSecret"
  sensitive   = true
}

variable "prefix" {
  description = "Prefix for all resources name"
  default     = "vault-radar-demo"
}

variable "cloud_provider" {
  description = "Cloud provider to be used"
  default     = "aws"
}

variable "region" {
  description = "Cloud region to be used"
  default     = "eu-west-1"
}

variable "hvn_cidr_block" {
  description = "HVN CIDR block"
  default     = "172.25.32.0/20"
}

variable "vault_tier" {
  description = "Tier for HCP Vault"
  default     = "dev"
}

variable "vault_public_endpoint" {
  description = "Is Vault endpoint avaiable publicly?"
  default     = true
}

