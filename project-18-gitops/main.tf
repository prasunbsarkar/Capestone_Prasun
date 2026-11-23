resource "local_file" "gitops_deployment" {
  filename = "deployment-status.txt"

  content = <<-EOT
  Project 18 - GitOps Infrastructure Deployment
  Deployment triggered through GitHub Actions.
  Status: Successfully applied by Terraform.
  EOT
}
