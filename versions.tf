terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "> 4.0.0"
    }
  }
  required_version = ">= 0.13"
}
