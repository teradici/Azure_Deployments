/*
 * Copyright (c) 2021 Teradici Corporation
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

variable "workstations" {
  description = "List of workstation types to create"
  type        = list(object({
      prefix           = string # The prefix applied to each VM name
      location         = string # The region this set will be deployed in
      workstation_os   = string # The OS type for this VM "windows" or "linux"
      vm_size          = string # Valid VM size for the region selected
      disk_type        = string # Valid VM disk type
      count            = number # The number of VMs of this type to create
      disk_size        = number # The size of the VM disk in GB
      isGFXHost        = bool   # High end graphics VM host indicator for the installation of graphics drivers
    }))
}