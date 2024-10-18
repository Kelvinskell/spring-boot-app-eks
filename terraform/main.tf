# Create a resource group
resource "aws_resourcegroups_group" "app_resources" {
  name = format("%s-%s-resources", var.env, var.app)

  resource_query {
    query = jsonencode({
      ResourceTypeFilters = ["AWS::AllSupported"]
      TagFilters = [
        {
          Key    = "Environment"
          Values = [var.env]
        },
        {
          Key    = "app"
          Values = [var.app]
        }
      ]
    })
  }
}