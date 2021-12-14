# terraform-cloudflare-maintenance

Cloudflare zone maintenance page leveraging Cloudflare workers module with approve listing. Takes a simple number of variables as input
along with a template to use to generate as HTML displayed to the user.

inspiration from https://github.com/adinhodovic/terraform-cloudflare-maintenance

<!-- BEGIN_TF_DOCS -->

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement_terraform) (>= 0.13)

- <a name="requirement_cloudflare"></a> [cloudflare](#requirement_cloudflare) (> 2.0.0)

## Providers

The following providers are used by this module:

- <a name="provider_cloudflare"></a> [cloudflare](#provider_cloudflare) (> 2.0.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [cloudflare_worker_route.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/worker_route) (resource)
- [cloudflare_worker_script.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/worker_script) (resource)
- [cloudflare_zones.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zones) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_cloudflare_zone"></a> [cloudflare_zone](#input_cloudflare_zone)

Description: n/a

Type: `string`

### <a name="input_name"></a> [name](#input_name)

Description: The Cloudflare worker name.

Type: `string`

### <a name="input_patterns"></a> [patterns](#input_patterns)

Description: The DNS pattern list to deploy the maintenance page to.

Type: `list(string)`

### <a name="input_body"></a> [body](#input_body)

Description: The Cloudflare worker html template that should be displayed (e.g. <!doctype html><head>...</head><body>...</body>).

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_allowlist_ips"></a> [allowlist_ips](#input_allowlist_ips)

Description: The IPs that are allowed to bypass the maintenance page.

Type: `string`

Default: `"placeholder"`

### <a name="input_enabled"></a> [enabled](#input_enabled)

Description: Flag to create/delete the worker route.

Type: `bool`

Default: `true`

### <a name="input_redirect_url"></a> [redirect_url](#input_redirect_url)

Description: URL to redirect traffic to. Uses var.http_status_code and supersedes `var.body`.

Type: `string`

Default: `""`

### <a name="input_http_ok_status_code"></a> [http_ok_status_code](#input_http_ok_status_code)

Description: Whether to return a 200 status code with templated response.

Type: `bool`

Default: false`

## Outputs

No outputs.

<!-- END_TF_DOCS -->
