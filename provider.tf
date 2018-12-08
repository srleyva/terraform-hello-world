variable GOOGLE_PROJECT_ID {}
variable GOOGLE_COMPUTE_ZONE {}

provider "google" {
  project = "${var.GOOGLE_PROJECT_ID}"
  zone    = "${var.GOOGLE_COMPUTE_ZONE}"
}
