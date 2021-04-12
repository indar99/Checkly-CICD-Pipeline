terraform {
  required_providers {
    checkly = {
      source = "checkly/checkly"
      version = "0.7.1"
    }
  }
}

terraform {
  backend "remote" {
    organization = "indar99"

    workspaces {
      name = "Checkly_CICD"
    }
  }
}

provider "checkly" {
  api_key = "${var.checkly_api_key}"
}
