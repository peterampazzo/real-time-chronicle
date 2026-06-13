# ---------------------------------------------------------------------------
# Zero Trust Access — protect the entire app on the custom domain.
# The Worker service and its custom domain (news.peterampazzo.com) are managed
# outside Terraform: deployed via Wrangler in CI and configured manually in
# the Cloudflare dashboard.
# ---------------------------------------------------------------------------

resource "cloudflare_zero_trust_access_application" "app" {
  zone_id = var.cloudflare_zone_id
  name    = "${var.project_name}-app"
  domain  = local.app_domain
  type    = "self_hosted"

  policies = [{
    name       = "Allow authorized email domains"
    decision   = "allow"
    precedence = 1
    include = [
      for d in var.allowed_email_domains : {
        email_domain = { domain = d }
      }
    ]
  }]
}
