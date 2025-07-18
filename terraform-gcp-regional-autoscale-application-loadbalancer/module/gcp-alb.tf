resource "google_compute_region_ssl_certificate" "gcp_certificate" {
  name        = "${var.prefix}-certificate"
  region      = var.gcp_region
  private_key = file("private.key")
  certificate = file("certificate.crt")
}

# URL Map
resource "google_compute_region_url_map" "bankapp_urlmap" {
  name        = "${var.prefix}-urlmap"
  description = "${var.prefix} Routing Rules for GCP ALB"
  region      = var.gcp_region

  default_service = google_compute_region_backend_service.gcp_alb_backend.id

  host_rule {
    hosts        = ["*"]
    path_matcher = "allpaths"
  }
  
  path_matcher {
    name            = "allpaths"
    default_service = google_compute_region_backend_service.gcp_alb_backend.id
  }

  test {
    service = google_compute_region_backend_service.gcp_alb_backend.id
    host    = "bankapp.singhritesh85.com"
    path    = "/"
  }
}

resource "google_compute_region_url_map" "http_redirect" {
  name   = "${var.prefix}-http-redirect"
  region = var.gcp_region

  default_url_redirect {
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"  ### 301 redirect
    strip_query            = false
    https_redirect         = true  ### Redirection is happening 
  }
}

resource "google_compute_region_backend_service" "gcp_alb_backend" {
  name     = "${var.prefix}-backend"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  region                = var.gcp_region

  backend {
    capacity_scaler = 1.0
    balancing_mode = "UTILIZATION"
    group = google_compute_region_instance_group_manager.bankapp_instance_group.instance_group
  }

  health_checks = [google_compute_region_health_check.gcp_alb_health_check.id]
  port_name     = "bankapp-application"  ### The same name should appear in the instance groups referenced by this service
}

resource "google_compute_region_health_check" "gcp_alb_health_check" {
  name                = "${var.prefix}-healthcheck"
  region              = var.gcp_region
  check_interval_sec  = 1
  timeout_sec         = 1
  healthy_threshold   = 2
  unhealthy_threshold = 2

  http_health_check {
    port               = "80"
    request_path       = "/index.html"
  }

}

resource "google_compute_address" "alb_static_ip" {
  name         = "${var.prefix}-static-ip"
  region       = var.gcp_region
  address_type = "EXTERNAL"
  description  = "Static IP for the GCP ALB"
}

resource "google_compute_forwarding_rule" "lb_frontend_https" {
  name                  = "${var.prefix}-lb-frontend-https"
  region                = var.gcp_region
  target                = google_compute_region_target_https_proxy.gcp_target_https_proxy.id
  port_range            = "443"
  ip_protocol           = "TCP"
  ip_address            = google_compute_address.alb_static_ip.address
  load_balancing_scheme = "EXTERNAL_MANAGED"
  depends_on            = [google_compute_subnetwork.gcp_proxy_subnet]
  network               = google_compute_network.gcp_vpc.id 
  network_tier          = "PREMIUM"
}

resource "google_compute_forwarding_rule" "lb_frontend_http" {
  name                  = "${var.prefix}-lb-frontend-http"
  region                = var.gcp_region
  target                = google_compute_region_target_http_proxy.gcp_target_http_proxy.id
  port_range            = "80"
  ip_protocol           = "TCP"
  ip_address            = google_compute_address.alb_static_ip.address
  load_balancing_scheme = "EXTERNAL_MANAGED"
  depends_on            = [google_compute_subnetwork.gcp_proxy_subnet]
  network               = google_compute_network.gcp_vpc.id
  network_tier          = "PREMIUM"
}

resource "google_compute_region_target_https_proxy" "gcp_target_https_proxy" {
  name             = "${var.prefix}-https-proxy"
  region           = var.gcp_region  
  url_map          = google_compute_region_url_map.bankapp_urlmap.id
  ssl_certificates = [google_compute_region_ssl_certificate.gcp_certificate.id]
}

resource "google_compute_region_target_http_proxy" "gcp_target_http_proxy" {
  name             = "${var.prefix}-http-proxy"
  region           = var.gcp_region
  url_map          = google_compute_region_url_map.http_redirect.id
}
