
resource "aws_subnet" "public" {
  count                   = 2
  cidr_block              = cidrsubnet(module.vpc.vpc_cidr, 8, 2 + count.index)
  availability_zone       = data.aws_availability_zones.available_zones.names[count.index]
  vpc_id                  = module.vpc.aws_vpc_id
  map_public_ip_on_launch = true
  tags = {
    Name = "public subnet"
  }
}

resource "aws_subnet" "private" {
  count             = 2
  cidr_block        = cidrsubnet(module.vpc.vpc_cidr, 8, count.index)
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  vpc_id            = module.vpc.aws_vpc_id
  tags = {
    Name = "private subnet"
  }
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}
