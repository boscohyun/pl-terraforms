cluster_name = "mimir-main"
region = "us-east-2"
environment = "prod"
mimir_image = "git-88d342f1d133731b6751bdbe3fed370c8096123a"
mimir_worker_image = "git-88d342f1d133731b6751bdbe3fed370c8096123a"
existing_vpc_id = "op://DX/DX Ecs Cluster tfvars/add more/vpc_id"
vpc_cidr_block = "10.0.0.0/16"
existing_subnet_ids_public = op://DX/DX Ecs Cluster tfvars/add more/existing_subnet_ids_public
existing_subnet_ids_private = op://DX/DX Ecs Cluster tfvars/add more/existing_subnet_ids_private
existing_internet_gateway_id = "op://DX/DX Ecs Cluster tfvars/add more/existing_internet_gateway_id"
db_username = "op://DX/DX Ecs Cluster tfvars/add more/db_username"
create_route_tables = true