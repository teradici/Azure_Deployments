/*
 * Copyright (c) 2021 Teradici Corporation
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

data "azurerm_key_vault_secret" "ad-pass" {
  count        = var.key_vault_id != "" ? 1 : 0
  name         = var.ad_pass_secret_name
  key_vault_id = var.key_vault_id
}

locals {
  windows_gfx_provisioning_script        = var.is_aadds == true ? "windows-gfx-provisioning-aadds.ps1" : "windows-gfx-provisioning.ps1"
  windows_gfx_provisioning_script_params = "${var.pcoip_registration_code} ${var.domain_name} ${var.ad_service_account_username} ${local.ad_admin_password} ${local.nvidia_driver_url} ${local.nvidia_driver_filename} ${var.application_id} ${var.aad_client_secret} ${var.enable_workstation_idle_shutdown} ${var.minutes_idle_before_shutdown} ${var.minutes_cpu_polling_interval} ${var.tenant_id}"

  nvidia_driver_url      = "https://go.microsoft.com/fwlink/?linkid=874181"
  nvidia_driver_filename = "452.57_grid_win10_server2016_server2019_64bit_international.exe"

  deploy_script_file_destination = "C:/Temp/${local.windows_gfx_provisioning_script}"
  deploy_temp_dir                = "C:/Temp"

  ad_admin_password      = var.key_vault_id == "" ? var.ad_service_account_password : tostring(data.azurerm_key_vault_secret.ad-pass[0].id)
  windows_admin_password = var.key_vault_id == "" ? var.ad_service_account_password : tostring(data.azurerm_key_vault_secret.ad-pass[0].value)

  is_windows = substr(pathexpand("~"), 0, 1) == "/" ? false : true
}
