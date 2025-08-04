terraform {
  backend "s3" {
    bucket = "dev-proj-1-jenkins-remote-state-bucket-8879493216"
    key    = "devops-project-1/jenkins/terraform.tfstate"
    region = "eu-west-1"
  }
}