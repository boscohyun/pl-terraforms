terraform {
  required_providers {
    aws = {
      version = ">= 3"
    }
  }
  required_version = ">= 1.3.6"

  backend "s3" {
    bucket = "9c-tfstates.planetarium.dev"
    key    = "9cutilbackend/mongodb"
    region = "ap-northeast-2"
  }
}

module "mongodb_ecs" {
  source = "../../modules/mongodb-ecs"

  cpu                         = 1024
  memory                      = 2048
  vpc_id                      = var.vpc_id
  cluster_name                = var.cluster_name
  create_cluster              = true
  desired_count               = 1
  subnets                     = var.subnets
}

module "zeroc_ecs" {
  source = "../../modules/zeroc-ecs"

  cpu                         = 1024
  memory                      = 2048
  vpc_id                      = var.vpc_id
  cluster_i                = moudle.mongodb_ecs.ecs_cluster_id
  image                       = "git-aa7e94562660561a24565f5581396c4fffdf1336"
  create_cluster              = false
  desired_count               = 1
  subnets                     = var.subnets
}
