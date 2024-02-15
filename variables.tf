variable "account_id" {
  type        = string
  description = "The Cloudflare account ID."
}
variable "allowlist_ips" {
  description = "The IPs that are allowed to bypass the maintenance page."
  type        = list(string)
  default     = []
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

variable "body" {
  type        = string
  description = "The Cloudflare worker html template that should be displayed (e.g. <!doctype html><head>...</head><body>...</body>)."
  default     = "<!doctype html><body>Site under maintenance</body>"
}

variable "redirect_url" {
  type        = string
  description = "URL to redirect traffic to. Uses var.http_status_code and supersedes var.body"
  default     = ""
}

variable "http_ok_status_code" {
  type        = bool
  description = "Whether to return a 200 status code with templated response"
  default     = false
}
