output "gcp_instance_template_autoscale_alb" {
  description = "Details of the Google Cloud Instance Template, Autoscale and Application LoadBalancer"
  value       = "${module.autoscale_alb}"
}
