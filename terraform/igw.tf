resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.env}-igw-${local.app}"
    app = local.app
    Environment = local.env
  }
}