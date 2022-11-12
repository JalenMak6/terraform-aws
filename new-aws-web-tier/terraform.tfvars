variable "network" {
    type = string
    default = "10.10.0.0/16"
}

variable "subnet" {
    type = list(string)
    default = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
    
}

variable "az" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# variable "subnet_num" {
#     type = list(number)
#   default = [1,2,3]
# }
#count = length(var.subnet)
