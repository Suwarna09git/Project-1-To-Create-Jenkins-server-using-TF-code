terraform {
    backend "s3" {
        bucket = "jenkins-server-terraform-32"
        region = "ap-south-1"
        key    = "project/terraform.tfstate"
    }
}
