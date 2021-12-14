resource "cloudflare_worker_script" "this" {
  name = format("maintenance-%s", replace(var.cloudflare_zone, ".", "-"))
  content = templatefile("${path.module}/maintenance.js", {
    content = var.template
  })
  plain_text_binding {
    name = "APPROVELIST_IPS"
    text = var.approvelist_ips
  }
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
