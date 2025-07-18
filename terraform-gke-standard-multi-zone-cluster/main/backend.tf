terraform {
  backend "gcs" {
    bucket  = "dolo-dempo"
    prefix  = "gke-multi-zone"
  }
}


