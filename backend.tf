terraform {
    backend "s3" {
        bucket = "young-minds-app-terraform-32"
        region = "ap-south-1"
        key    = "project/terraform.tfstate"
    }
}
