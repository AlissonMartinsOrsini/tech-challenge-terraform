resource "aws_db_instance" "postgres" {
  db_subnet_group_name   = aws_db_subnet_group.postgres.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  for_each = toset(["auth", "flag", "targeting"])

  identifier        = "togglemaster-${each.value}"
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = "togglemaster"
  username = "dbadmin"
  password = var.db_password

  publicly_accessible    = false
  skip_final_snapshot    = true
  backup_retention_period = 0

  tags = {
    Project     = "ToggleMaster"
    Service     = each.value
    ManagedBy   = "Terraform"
  }
}