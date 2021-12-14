variable "cloudflare_zone" {
  type = string
}

variable "patterns" {
  type        = list(string)
  description = "The DNS pattern list to deploy the maintenance page to."
}

variable "template" {
  type        = string
  description = "The Cloudflare worker html template that should be displayed (e.g. <!doctype html><head>...</head><body>...</body>)."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to create/delete the worker route."
}

variable "approvelist_ips" {
  default     = "placeholder"
  description = "The IPs that are approve listed to bypass the maintenance page."
  type        = string
}
