region = "centralus"

vnets-map = {
    VNET1_Prod = {
        name = "VNET1_Prod"
        address_space = ["10.0.0.0/16"]
        subnets-map = {
            subnet1 = {
                subnet_name = "Gateway"
                subnet_address_space = ["10.0.1.0/27"]
            },
            subnet2 = {
                subnet_name = "Services"
                subnet_address_space = ["10.0.2.0/24"]
            }
        }
    },
    VNET1_Tier1 = {
        name = "VNET1_Tier1"
        address_space = ["10.0.0.0/16"]
        subnets-map = {
            subnet1 = {
                subnet_name = "Gateway"
                subnet_address_space = ["10.0.1.0/27"]
            },
            subnet2 = {
                subnet_name = "Services"
                subnet_address_space = ["10.0.2.0/24"]
            }
        }
    },
    VNET1_Storage = {
        name = "VNET1_Storage"
        address_space = ["10.0.0.0/16"]
        subnets-map = {
            subnet1 = {
                subnet_name = "Gateway"
                subnet_address_space = ["10.0.1.0/27"]
            },
            subnet2 = {
                subnet_name = "Services"
                subnet_address_space = ["10.0.2.0/24"]
            }
        }
    },
    VNET1_Services = {
        name = "VNET1_Services"
        address_space = ["10.0.0.0/16"]
        subnets-map = {
            subnet1 = {
                subnet_name = "Gateway"
                subnet_address_space = ["10.0.1.0/27"]
            },
            subnet2 = {
                subnet_name = "Services"
                subnet_address_space = ["10.0.2.0/24"]
            }
        }
    },
}



