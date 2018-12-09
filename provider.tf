variable GOOGLE_PROJECT_ID {}
variable GOOGLE_COMPUTE_ZONE {}
variable TERRAFORM_STATE_BUCKET {}
variable ENVIRONMENT {}

provider "google" {
  project = "${var.GOOGLE_PROJECT_ID}"
  zone    = "${var.GOOGLE_COMPUTE_ZONE}"
}

data "terraform_remote_state" "bucket_state" {
  backend = "gcs"

  config {
    bucket = "${var.TERRAFORM_STATE_BUCKET}"
    prefix = "${var.ENVIRONMENT}"
  }
}
