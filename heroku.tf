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

  buildpacks = [
    "heroku/ruby",
  ]
}

resource "heroku_app_config_association" "default" {
  app_id = heroku_app.default.id
  vars = heroku_config.common.vars
}

resource "heroku_addon" "database" {
  app  = heroku_app.default.name
  plan = "jawsdb:kitefin"
}

resource "heroku_addon" "monitoring" {
  app  = heroku_app.default.name
  plan = "scout:chair"
}

resource "heroku_addon" "error-monitoring" {
  app  = heroku_app.default.name
  plan = "sentry:f1"
}
