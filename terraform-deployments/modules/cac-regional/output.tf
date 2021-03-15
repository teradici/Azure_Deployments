/*
 * Copyright (c) 2021 Teradici Corporation
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

output "cac-public-ip" {
  value = azurerm_public_ip.cac.*.ip_address
}