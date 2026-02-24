data "aws_route_tables" "selected" {
  filter {
    name   = "tag:Name"
    values = var.route_table_names
  }
}