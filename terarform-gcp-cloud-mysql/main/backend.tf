terraform {
  backend "gcs" {
    bucket  = "dolo-dempo"
    prefix  = "cloud-sql/mysql"
  }
}
