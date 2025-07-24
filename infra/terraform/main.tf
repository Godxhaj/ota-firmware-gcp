provider "google" {
  project = "iot123project"
  region = "us-central1"
}

resource "google_storage_bucket" "ota-firmware-bucket" {
  name = "ota-firmware-bucket" 
  location = "us-central1"
  force_destroy = false
  public_access_prevention = "enforced"
  uniform_bucket_level_access = true
}

resource "google_pubsub_topic" "ota-updates" {
  name = "ota-updates"
}
