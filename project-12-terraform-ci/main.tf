terraform {
  required_version = ">= 1.5.0"
}

resource "terraform_data" "ci_demo" {
  input = {
    project = "Project 12"
    purpose = "Terraform CI pipeline demonstration"
  }
}
