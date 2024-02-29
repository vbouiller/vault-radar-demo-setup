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
    hostname     = "app.eu.terraform.io"
    organization = "TFC-Unification-Test-Org-2"
    workspaces {
      project = "vbouiller-project"
      name    = "vbouiller-vault-radar-demo"
    }
  }
}