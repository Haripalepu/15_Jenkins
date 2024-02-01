#To store the vpc id then we can fetch the id using data store
#first we need to ouput the vpc id in module then we can store it in parameters.

resource "aws_ssm_parameter" "vpc_id" {  #09_Terraform_Modules/01_vpc_module/outputs.tf
  name  = "/${var.project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = module.aws_vpc.vpc_id
  #overwrite = var.overwrite
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/public_subnet_ids"
  type  = "StringList"
  value = join(",", module.aws_vpc.public_subnet_ids)
  #overwrite = var.overwrite
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/private_subnet_ids"
  type  = "StringList"
  value = join(",", module.aws_vpc.private_subnet_ids)
  #overwrite = var.overwrite
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/database_subnet_ids"
  type  = "StringList"
  value = join(",", module.aws_vpc.database_subnet_ids)
  #overwrite = var.overwrite
}

