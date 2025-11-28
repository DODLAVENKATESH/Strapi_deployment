module "vpc" {
  source = "./modules/vpc"
}

module "ecr" {
  source = "./modules/ecr"
}

module "rds" {
  source = "./modules/rds"
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "ecs" {
  source              = "./modules/ecs"
  subnet_id           = module.vpc.public_subnet
  security_group_id   = module.security.ecs_sg_id
  ecr_repo_url        = module.ecr.repo_url
  db_host             = module.rds.address
  db_password         = module.rds.password
}
