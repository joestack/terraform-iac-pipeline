variable "tfc_host" {
  description = "The API endpoint of your Terraform environment. Terraform Cloud is the default"
  default = "app.terraform.io"
}

variable "tfc_org" {
  description = "The name of the Terraform Organization to be used. (the value is key sensitive !!!)"
  default = "JoeStack"
}

variable "gh_vcs_repo" {
  description = "Name of the Repository/Workspace to be created"
}

variable "tfc_token" {
  description = "The Terraform Token to be used by the Terraform TFE provider"
}

variable "github_token" {
  description = "The GitHub OAuth Token to be used by the Terraform GitHub provider"
}

variable "oauth_token_id" {
  description = "The OAuth Token ID that is used by your Terraform Organization to access the GitHub repository"
}