terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.36, < 5.0.0"
    }

    newrelic = {
      source  = "newrelic/newrelic"
      version = ">= 2.37.0"
    }
  }
}
