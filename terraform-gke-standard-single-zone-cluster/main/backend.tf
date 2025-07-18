terraform {
  backend "gcs" {
    bucket  = "dolo-dempo"
    prefix  = "gke-single-zone"
  }
}


