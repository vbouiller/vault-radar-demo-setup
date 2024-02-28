terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.83.0"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.25.0"
    }
  }

  cloud {
    organization = "vbouiller-org"

    workspaces {
      name = "vault-radar-demo"
    }
  }
}