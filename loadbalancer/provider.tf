provider "fastly" {
  api_key = "${var.fastly_api_key}"
}

provider "aws" {}
