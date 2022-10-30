resource "aws_subnet" "public_subnet" {
    count = length(var.subnet)
    vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = element(var.subnet, count.index)
    availability_zone = element(var.az, count.index)
    map_public_ip_on_launch = true
    enable_resource_name_dns_a_record_on_launch = true
    assign_ipv6_address_on_creation = true
    ipv6_cidr_block = cidrsubnet(aws_vpc.terraform_vpc.ipv6_cidr_block, 8, count.index)
    
    tags = {
        Name = "public_subnet-${count.index+1}"
      
    }
  
}
output "subnetid"{
    value = aws_subnet.public_subnet
}