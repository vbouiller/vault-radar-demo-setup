provider "hcp" {
  client_id     = var.client_id
  client_secret = var.client_secret
}

resource "hcp_hvn" "hcp_platform" {
  hvn_id         = "${var.prefix}-hvn"
  cloud_provider = var.cloud_provider
  region         = var.region
  cidr_block     = var.hvn_cidr_block
}

resource "hcp_vault_cluster" "hcp_vault" {
  cluster_id      = var.prefix
  hvn_id          = hcp_hvn.hcp_platform.hvn_id
  tier            = var.vault_tier
  public_endpoint = var.vault_public_endpoint
}

resource "hcp_vault_cluster_admin_token" "vault_token" {
  cluster_id = hcp_vault_cluster.hcp_vault.cluster_id
}

provider "vault" {
  address   = hcp_vault_cluster.hcp_vault.vault_public_endpoint_url
  token     = hcp_vault_cluster_admin_token.vault_token.token
  namespace = hcp_vault_cluster.hcp_vault.namespace
}

resource "vault_mount" "kvv2" {
  path    = "kv"
  type    = "kv"
  options = { version = "2" }
}

resource "vault_kv_secret_v2" "aws_1" {
  mount = vault_mount.kvv2.path
  name  = "aws/1"
  data_json = jsonencode(
    {
      aws_access_key_id = "AKIAE2647DD83A384175",
      aws_secret_key    = "g4fEPvwN2+2kT8omL4ieFqgVj4xLWx40PxNmOJ3S"
    }
  )
}

resource "vault_kv_secret_v2" "aws_2" {
  mount = vault_mount.kvv2.path
  name  = "aws/2"
  data_json = jsonencode(
    {
      aws_access_key_id = "AKIADE1C9C6F7B9F45D3",
      aws_secret_key    = "PvL4FjrrSXyT7qrllCS42SoNFbNI1c5NBJNqi8In"
    }
  )
}

resource "vault_kv_secret_v2" "gh" {
  mount = vault_mount.kvv2.path
  name  = "github"
  data_json = jsonencode(
    {
      PAT = "glpat-xzrNG3PhxcKpUQdX2NHT"
    }
  )
}

resource "vault_kv_secret_v2" "vlt" {
  mount = vault_mount.kvv2.path
  name  = "vault"
  data_json = jsonencode(
    {
      Token = "hvs.4kZkME6mRPIc9HGX3rpVet8r"
    }
  )
}