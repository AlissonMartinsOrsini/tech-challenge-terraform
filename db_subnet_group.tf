
resource "aws_db_subnet_group" "postgres" {
  name = "togglemaster-db-subnets"

  subnet_ids = aws_subnet.private[*].id

  tags = {
    Project = "ToggleMaster"
  }
}
