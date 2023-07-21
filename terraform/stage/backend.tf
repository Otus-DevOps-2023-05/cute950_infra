terraform {
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "reddit-bucket"
    region   = "ru-central1"
    key      = "stage/terraform.tfstate"
    # access_key = "YCAJEbsln_Y4cax3aIBAZPnPy"
    # secret_key = "YCOwf8ZnL6q3Tj-FWLeVSNjZuMySvJ3etfzdiw1R"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
