# Kochiku::Heroku
Kochiku::Heroku creates an empty heroku app configured with ruby buildpack, JawsDB, NewRelic, and Sentry using power of Terraform. This is useful when you're creating Rails applications.

# Motivation
I'm so sick of keep forgetting `heroku config:add TZ=Asia/Tokyo` and `heroku config:add LANG=ja_JP.UTF-8` commands. And the only moment I actually notice that is when I connect to database and look at the created_at column.

# Usage
## Initialization
```
$ terraform init
```

## Create a Heroku App
```
$ terraform apply \
  -var app_name="YOUR-APP-NAME" \
  -var email="YOUR@EMAIL.COM" \
  -var api_key="YOUR-API-KEY"
```

or create a file named `terraform.tfvars` with the following contents:

```
api_key  = "YOUR-API-KEY"
app_name = "YOUR-APP-NAME"
email    = "YOUR@EMAIL.COM"
```

Then run:

```
$ terraform apply
```
