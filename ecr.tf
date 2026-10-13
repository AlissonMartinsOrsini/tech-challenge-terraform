resource "aws_ecr_repository" "microsservicos" {
  for_each = toset([
    "auth",
    "flag",
    "targeting",
    "evaluation",
    "analytics"
  ])

  name         = "togglemaster-${each.value}"
  force_delete = false
}