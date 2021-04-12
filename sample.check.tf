resource "checkly_check_group" "test-group1" {
  name      = "Terraform-Testing"
  activated = true
  muted     = false
  tags = [
    "github-cicd-pipeline"
  ]

  locations = [
    "eu-west-1",
  ]
  concurrency = 3
  double_check              = true
  use_global_alert_settings = true
}



resource "checkly_check" "example-api-check" {
  name                      = "Example API check"
  type                      = "API"
  activated                 = true
  frequency                 = 1
  double_check              = true
  use_global_alert_settings = true
  group_id = "${checkly_check_group.test-group1.id}"
  group_order = 1

  locations = [
    "us-west-1",
    "eu-central-1"
  ]

  request {
    url              = "https://api.example.com/"
    follow_redirects = true
    assertion {
      source     = "STATUS_CODE"
      comparison = "EQUALS"
      target     = "200"
    }
  }
}
