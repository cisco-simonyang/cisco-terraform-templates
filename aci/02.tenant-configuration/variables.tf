variable "apic" {
  type = map(any)
  default = {
    username = ""
    password = ""
    url      = ""
  }
}

variable "tenant" {
  type = map(any)
  default = {
    name = ""
    # description = "This tenant is created by terraform"
    # annotation  = "tag_tenant"
    # name_alias  = "alias_tenant"
  }
}

variable "vrfs" {
  type = map(any)
  default = {
    vrf_name = {
      description = ""
      # annotation             = "tag_vrf"
      # bd_enforced_enable     = "no"
      # ip_data_plane_learning = "enabled"
      # knw_mcast_act          = "permit"
      # name_alias             = "alias_vrf"
      # pc_enf_dir             = "egress"
      # pc_enf_pref            = "unenforced"
    }
  }
}

variable "bds" {
  type = map(any)
  default = {
    prod_bd = { # key = bd name
      vrf = "vrf_name"
      #     description                 = "sample bridge domain"
      #     name                        = "demo_bd"
      #     optimize_wan_bandwidth      = "no"
      #     annotation                  = "tag_bd"
      #     arp_flood                   = "no"
      #     ep_clear                    = "no"
      #     ep_move_detect_mode         = "garp"
      #     host_based_routing          = "no"
      #     intersite_bum_traffic_allow = "yes"
      #     intersite_l2_stretch        = "yes"
      #     ip_learning                 = "yes"
      #     ipv6_mcast_allow            = "no"
      #     limit_ip_learn_to_subnets   = "yes"
      #     mac                         = "00:22:BD:F8:19:FF"
      #     mcast_allow                 = "yes"
      #     multi_dst_pkt_act           = "bd-flood"
      #     name_alias                  = "alias_bd"
      #     bridge_domain_type          = "regular"
      #     unicast_route               = "no"
      #     unk_mac_ucast_act           = "flood"
      #     unk_mcast_act               = "flood"
      #     vmac                        = "not-applicable"
    },
    test_bd = {}
  }
}

variable "subnets" {
  type = map(any)
  default = {
    prod_bd_1 = {
      bd          = "prod_bd"
      ip          = "10.10.101.1/24"
      description = "Subnet Created Using Terraform"
    },
    prod_bd_2 = {
      bd          = "prod_bd"
      ip          = "10.10.102.1/24"
      description = "Subnet Created Using Terraform"
      # annotation       = "tag_subnet"
      # ctrl             = ["querier" "nd"]
      # name_alias       = "alias_subnet"
      # preferred        = "no"
      # scope            = ["private" "shared"]
      # virtual          = "yes"
    }
  }
}
variable "filters" {
  description = "Create filters with these names and ports"
  type        = map(any)
  default     = {
        filter_https = {
            filter   = "https"
            entry    = "https"
            protocol = "tcp"
            port     = "443"
        }
        filter_sql = {
            filter   = "sql"
            entry    = "sql"
            protocol = "tcp"
            port     = "1433"
        }
    }
}
variable "contracts" {
  description = "Create contracts with these filters"
  type        = map(any)
  default = {
    contract_web = {
      contract = "web"
      subject  = "https"
      filter   = "filter_https"
    }
    contract_sql = {
      contract = "sql"
      subject  = "sql"
      filter   = "filter_sql"
    }
  }
}
variable "ap" {
  description = "Create application profile"
  type        = string
  default     = "intranet"
}
variable "epgs" {
  description = "Create epg"
  type        = map(any)
  default = {
    web_epg = {
      epg   = "web"
      bd    = "prod_bd"
      encap = "21"
    },
    db_epg = {
      epg   = "db"
      bd    = "prod_bd"
      encap = "22"
    }
  }
}
variable "epg_contracts" {
  description = "epg contracts"
  type        = map(any)
  default = {
    terraform_one = {
      epg           = "web_epg"
      contract      = "contract_web"
      contract_type = "provider"
    },
    terraform_two = {
      epg           = "web_epg"
      contract      = "contract_sql"
      contract_type = "consumer"
    },
    terraform_three = {
      epg           = "db_epg"
      contract      = "contract_sql"
      contract_type = "provider"
    }
  }
}

variable "epg_static_path" {
  description = "epg static path"
  type        = map(any)
  default = {
    static_1 = {
      epg           = "web_epg"
      tdn           = "topology/pod-1/paths-101/pathep-[eth1/1]"
      encap         = "vlan-100"
      contract_type = "provider"
    }
  }
}

