/*
 * Copyright (c) 2019 Teradici Corporation
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

terraform {
  required_version = ">= 0.13.5"
}

provider "azurerm" {
  version = "=2.2.0"
  features {}
}
