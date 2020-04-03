variable "email" {}
variable "api_key" {}
variable "app_name" {}

provider "heroku" {
  api_key = var.api_key
  email   = var.email
}

resource "heroku_config" "common" {
  vars = {
    LANG = "ja_JP.UTF-8"
    TZ   = "Asia/Tokyo"
  }
}

resource "heroku_app" "default" {
  name   = var.app_name
  region = "us"
}
