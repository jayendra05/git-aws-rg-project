provider "aws" {
  region = "ap-south-1"
}

resource "aws_resourcegroups_group" "india_groups" {
  for_each = toset(var.resource_groups)

  name = each.value

  resource_query {
    type = "TAG_FILTERS_1_0"

    query = jsonencode({
      ResourceTypeFilters = ["AWS::AllSupported"]
      TagFilters = [
        {
          Key    = "Environment"
          Values = ["India"]
        }
      ]
    })
  }
}