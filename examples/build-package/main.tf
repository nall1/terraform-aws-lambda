provider "aws" {
  region = "us-east-1"

  # Make it faster by skipping something
  skip_get_ec2_platforms      = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

resource "random_pet" "this" {
  length = 2
}

#################
# Build packages
#################

# Create zip-archive of a single directory where "npm install" will also be executed (default for nodejs runtime)
module "package_dir_with_npm_install" {
  source = "../../"

  create_function = false

  runtime     = "nodejs14.x"
  source_path = "${path.module}/../fixtures/nodejs14.x-app1"
}

