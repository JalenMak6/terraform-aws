resource "aws_vpc" "terraform_vpc" {
    cidr_block = var.network
    assign_generated_ipv6_cidr_block = true
    instance_tenancy = "default"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
      Name = "terraform_vpc"
    }
  
}


resource "aws_route_table_association" "subnet_0" {
  subnet_id      = aws_subnet.public_subnet[0].id
  route_table_id = aws_route_table.tf_route_table.id
}

resource "aws_route_table_association" "subnet_1" {
  subnet_id      = aws_subnet.public_subnet[1].id
  route_table_id = aws_route_table.tf_route_table.id
}

resource "aws_route_table_association" "subnet_2" {
  subnet_id      = aws_subnet.public_subnet[2].id
  route_table_id = aws_route_table.tf_route_table.id
}

output "ipv6_vpc" {
  value = aws_vpc.terraform_vpc.ipv6_cidr_block
}

resource "aws_network_interface" "nic_ec2_1" { 
  subnet_id       = aws_subnet.public_subnet[0].id
  security_groups = [aws_security_group.terraform_security_group.id]

}

resource "aws_network_interface" "nic_ec2_2" { 
  subnet_id       = aws_subnet.public_subnet[1].id
  security_groups = [aws_security_group.terraform_security_group.id]

}

