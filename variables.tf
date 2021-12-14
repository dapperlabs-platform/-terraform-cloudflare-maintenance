variable "allowlist_ips" {
  default     = "placeholder"
  description = "The IPs that are allowed to bypass the maintenance page."
  type        = string
}

variable "cloudflare_zone" {
  type = string
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to create/delete the worker route."
}

variable "name" {
  type        = string
  description = "The Cloudflare worker name."
}

variable "patterns" {
  type        = list(string)
  description = "The DNS pattern list to deploy the maintenance page to."
}

variable "template" {
  type        = string
  description = "The Cloudflare worker html template that should be displayed (e.g. <!doctype html><head>...</head><body>...</body>)."
}
