terraform {
    backend "s3" {
        bucket = "young-minds-app-terraform-state"
        region = "ap-south-1"
        key    = "project/terraform.tfstate"
    }
}
