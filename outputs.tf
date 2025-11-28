output "ecs_public_ip" {
  value = module.ecs.public_ip
}

output "db_address" {
  value = module.rds.address
}

output "ecr_repo" {
  value = module.ecr.repo_url
}
