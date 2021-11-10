//--------------------------------------------------------------------
// Variables
variable "server_profile_boot_mode" {}
variable "server_profile_mtu" {}
variable "server_profile_target_platform" {}
variable "server_profile_vnic_name" {}

//--------------------------------------------------------------------
// Modules
module "server_profile" {
  source  = "app.terraform.io/ucsx/server-profile/intersight"
  version = "0.1.0"

  boot_mode = "${var.server_profile_boot_mode}"
  boot_order_policy = "local-boot-drive"
  cluster_vlan = "test-jke-esxi-eth-nw-grp"
  ethernet_network_group = "test-jke-esxi-eth-nw-ct"
  imc_access_policy = "lab_ucsx01_imc"
  imc_access_vlan = 101
  ip_pool = "nclb-ucsx-IP-Pool-Mgmt"
  lan_connectivity_policy = "ucsx-demo_lan01"
  local_user_policy = "test-jke-local-user"
  local_username = "admin"
  local_username_password = "ncpw4Lab."
  mac_pool = "nclb-ucsx-Mac-Pool-A"
  mtu = "${var.server_profile_mtu}"
  organization = "default"
  server_list = "nclb-demo-ucsx01-1-4"
  server_profile_action = "Deploy"
  target_platform = "${var.server_profile_target_platform}"
  vnic_name = "eth2"
}