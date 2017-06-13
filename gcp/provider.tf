provider "google" {
  credentials = "${file("${path.module}/High Availability-8fa0e457e296.json")}"
  project     = "fresh-sensor-170014"
  region      = "us-central1"
}
