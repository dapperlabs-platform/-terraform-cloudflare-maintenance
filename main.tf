resource "cloudflare_worker_script" "this" {
  account_id = var.account_id
  name       = var.name
  content = templatefile("${path.module}/maintenance.js", {
    body         = var.body
    redirectURL  = var.redirect_url
    allowlistIPs = join(",", var.allowlist_ips)
    statusCode   = var.http_ok_status_code ? 200 : 503
  })
}

data "cloudflare_zones" "this" {
  filter {
    name = var.cloudflare_zone
  }
}

resource "cloudflare_worker_route" "this" {
  count       = var.enabled != false ? length(var.patterns) : 0
  zone_id     = lookup(data.cloudflare_zones.this.zones[0], "id")
  pattern     = var.patterns[count.index]
  script_name = cloudflare_worker_script.this.name
}
