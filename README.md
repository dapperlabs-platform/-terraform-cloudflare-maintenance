# terraform-cloudflare-maintenance
Cloudflare zone maintenance page leveraging Cloudflare workers module with approve listing.  Takes a simple number of variables as input 
along with a template to use to generate as HTML displayed to the user.

inspiration from https://github.com/adinhodovic/terraform-cloudflare-maintenance
<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 0.13)

- <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) (> 2.0.0)

## Providers

The following providers are used by this module:

- <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) (> 2.0.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [cloudflare_worker_route.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/worker_route) (resource)
- [cloudflare_worker_script.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/worker_script) (resource)
- [cloudflare_zones.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zones) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_cloudflare_zone"></a> [cloudflare\_zone](#input\_cloudflare\_zone)

Description: n/a

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: The Cloudflare worker name.

Type: `string`

### <a name="input_patterns"></a> [patterns](#input\_patterns)

Description: The DNS pattern list to deploy the maintenance page to.

Type: `list(string)`

### <a name="input_template"></a> [template](#input\_template)

Description: The Cloudflare worker html template that should be displayed (e.g. <!doctype html><head>...</head><body>...</body>).

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_allowlist_ips"></a> [allowlist\_ips](#input\_allowlist\_ips)

Description: The IPs that are allowed to bypass the maintenance page.

Type: `string`

Default: `"placeholder"`

### <a name="input_enabled"></a> [enabled](#input\_enabled)

Description: Flag to create/delete the worker route.

Type: `bool`

Default: `true`

## Outputs

No outputs.
<!-- END_TF_DOCS -->