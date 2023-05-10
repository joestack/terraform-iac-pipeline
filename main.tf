terraform {
  required_version = ">= 0.13"
  required_providers {
    tfe = {
      version = "~> 0.44.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "tfe" {
  hostname = var.tfc_host
  token    = var.tfc_token
}

provider "github" {
  token = var.github_token
}

### GitHub Repo(s)

resource "github_repository" "example" {
  name        = var.gh_vcs_repo
  description = "Home of ${var.gh_vcs_repo}"
  visibility = "public"
  auto_init = true
}

#### Terraform Workspace(es) and Variables

resource "tfe_workspace" "example" {
  name         = var.gh_vcs_repo
  organization = var.tfc_org
  project_id   = "prj-RCk4632hYKKqVvyj"
  tag_names    = []
  vcs_repo {
    identifier = github_repository.example.full_name
    oauth_token_id = var.oauth_token_id
  }
  allow_destroy_plan = true
  auto_apply = true
  global_remote_state = true 
  queue_all_runs = true  
  terraform_version = "1.4.6" 
}