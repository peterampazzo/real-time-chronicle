output "app_url" {
  description = "Production URL for the app."
  value       = "https://${local.app_domain}"
}

output "access_application_id" {
  description = "Cloudflare Zero Trust Access application ID."
  value       = cloudflare_zero_trust_access_application.app.id
}

output "access_application_aud" {
  description = "JWT audience tag for the Access application."
  value       = cloudflare_zero_trust_access_application.app.aud
}

output "cloudflare_zone_id" {
  description = "Configured zone ID."
  value       = var.cloudflare_zone_id
}
