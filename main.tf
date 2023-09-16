
  provider "kubernetes" {
    secret_suffix    = "patrice"
    config_path      = "~/.kube/config"
  }

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  
  token = ""
  owner = ""
}


resource "github_repository" "terraform-Push-github"{
  name        = "terraform-Push-github"
  description = "create repository in github en push des code usiing scripting bash and terraform"
  visibility = "public"
}

# Configuration du répertoire local du projet
locals {
  project_path = "../terraform/"
}

# Configuration du dépôt Git
resource "null_resource" "git_push" {
  triggers = {
    repository_id = github_repository.terraform-Push-github.id
  }

  provisioner "local-exec" {
    command = <<-EOT
      cd "${local.project_path}"
      git init
      git add .
      git commit -m "first commit"
      git remote add origin "https://github.com/${var.owner_name}/${var.repositoty_name}.git"
      git push -u origin master
    EOT
  }
}