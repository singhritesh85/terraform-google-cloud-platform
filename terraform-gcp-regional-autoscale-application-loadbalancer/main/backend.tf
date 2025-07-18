terraform {
  backend "gcs" {
    bucket  = "dolo-dempo"
    prefix  = "regional-state/autoscale-alb"
  }
}
