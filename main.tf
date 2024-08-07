###This is provider section - Do not touch!
provider "aws" {
  region                  = "us-east-2"
}
###This is the module for IAM management
module "iam" {
  source = "./iam"
}
###This is the module for Network
module "network" {
  source = "./network"
}
###This is the module for API (Presentation layer)
module "api" {
  source = "./api"
  vpc_id = module.network.vpc_id
  pub_sub_1_id = module.network.pub_sub_1_id
  pub_sub_2_id = module.network.pub_sub_2_id
  alb_sg = module.network.alb_sg
  api_sg = module.network.api_sg
}
###This is the module for WEB (Application layer)
module "web" {
  source = "./web"
}
###This is the module for DB (Database layer)
module "db" {
  source = "./db"
}
###This is the module for Backups
module "backup" {
  source = "./backup"
}
###This is the module for CDN (CloudFront)
module "cdn" {
  source = "./cdn"
}
###This is the module for Security
module "security" {
  source = "./security"
}
###This is the module for CloudWatch monitoring
module "cloudwatch" {
  source = "./cloudwatch"
}
###This is the module for Logs - ELK Stack
module "logging" {
  source = "./logging"
}
###This is the module for Extra tf files
module "extra" {
  source = "./extra"
}