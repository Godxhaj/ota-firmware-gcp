provider "google" {
  project = "iot123project"
  region  = "us-central1"
}

resource "google_storage_bucket" "ota-firmware-bucket" {
  name                        = "ota-firmware-bucket"
  location                    = "us-central1"
  force_destroy               = false
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
}

resource "google_pubsub_topic" "ota-updates" {
  name = "ota-updates"
}

resource "google_project_iam_member" "github_sa_storage_admin" {
  project = "iot123project"
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:github-ci@iot123project.iam.gserviceaccount.com"
}
