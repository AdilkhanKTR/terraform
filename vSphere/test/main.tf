provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "DNST-DC"
}

data "vsphere_datastore" "datastore" {
  name          = "esxi-02-datastore-2"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Development"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "net" {
  name          = "VLAN 777"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "Adil"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_virtual_machine_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm-01" {
  name             = "VM-GITLAB-RUNNER"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 1
  memory   = 1024
  guest_id = "centos64Guest"

  network_interface {
    network_id = data.vsphere_network.net.id
  }

  disk {
    label = "disk0"
    size  = 40
    thin_provisioned = "false"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "VM-GITLAB-RUNNER"
        domain = "dnst.kz"
      }

      network_interface {
        ipv4_address = "172.31.22.40"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.31.22.1"
      dns_server_list = ["172.31.88.200"]
    }
  }
}

resource "vsphere_virtual_machine" "vm-02" {
  name             = "VM-Harbor"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 1
  memory   = 1024
  guest_id = "centos64Guest"

  network_interface {
    network_id = data.vsphere_network.net.id
  }

  disk {
    label = "disk0"
    size  = 40
    thin_provisioned = "false"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "VM-Harbor"
        domain = "dnst.kz"
      }

      network_interface {
        ipv4_address = "172.31.22.41"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.31.22.1"
      dns_server_list = ["172.31.88.200"]
    }
  }
}

resource "vsphere_virtual_machine" "vm-03" {
  name             = "VM-KM-01"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 1
  memory   = 1024
  guest_id = "centos64Guest"

  network_interface {
    network_id = data.vsphere_network.net.id
  }

  disk {
    label = "disk0"
    size  = 40
    thin_provisioned = "false"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "VM-KM-02"
        domain = "dnst.kz"
      }

      network_interface {
        ipv4_address = "172.31.22.42"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.31.22.1"
      dns_server_list = ["172.31.88.200"]
    }
  }
}

resource "vsphere_virtual_machine" "vm-04" {
  name             = "VM-KM-02"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 1
  memory   = 1024
  guest_id = "centos64Guest"

  network_interface {
    network_id = data.vsphere_network.net.id
  }

  disk {
    label = "disk0"
    size  = 40
    thin_provisioned = "false"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "VM-KM-02"
        domain = "dnst.kz"
      }

      network_interface {
        ipv4_address = "172.31.22.43"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.31.22.1"
      dns_server_list = ["172.31.88.200"]
    }
  }
}

resource "vsphere_virtual_machine" "vm-05" {
  name             = "VM-KWN-01"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 1
  memory   = 1024
  guest_id = "centos64Guest"

  network_interface {
    network_id = data.vsphere_network.net.id
  }

  disk {
    label = "disk0"
    size  = 40
    thin_provisioned = "false"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "VM-KWN-01"
        domain = "dnst.kz"
      }

      network_interface {
        ipv4_address = "172.31.22.44"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.31.22.1"
      dns_server_list = ["172.31.88.200"]
    }
  }
}

resource "vsphere_virtual_machine" "vm-06" {
  name             = "VM-KWN-02"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 2048
  guest_id = "centos64Guest"

  network_interface {
    network_id = data.vsphere_network.net.id
  }

  disk {
    label = "disk0"
    size  = 40
    thin_provisioned = "false"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "VM-KWN-02"
        domain = "dnst.kz"
      }

      network_interface {
        ipv4_address = "172.31.22.45"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.31.22.1"
      dns_server_list = ["172.31.88.200"]
    }
  }
}

resource "vsphere_virtual_machine" "vm-07" {
  name             = "VM-KWN-03"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 2048
  guest_id = "centos64Guest"

  network_interface {
    network_id = data.vsphere_network.net.id
  }

  disk {
    label = "disk0"
    size  = 40
    thin_provisioned = "false"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "VM-KWN-03"
        domain = "dnst.kz"
      }

      network_interface {
        ipv4_address = "172.31.22.46"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.31.22.1"
      dns_server_list = ["172.31.88.200"]
    }
  }
}

resource "vsphere_virtual_machine" "vm-08" {
  name             = "VM-KWN-04"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 2048
  guest_id = "centos64Guest"

  network_interface {
    network_id = data.vsphere_network.net.id
  }

  disk {
    label = "disk0"
    size  = 40
    thin_provisioned = "false"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "VM-KWN-04"
        domain = "dnst.kz"
      }

      network_interface {
        ipv4_address = "172.31.22.47"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.31.22.1"
      dns_server_list = ["172.31.88.200"]
    }
  }
}

resource "vsphere_virtual_machine" "vm-09" {
  name             = "VM-WebServer-Dev"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 2048
  guest_id = "centos64Guest"

  network_interface {
    network_id = data.vsphere_network.net.id
  }

  disk {
    label = "disk0"
    size  = 40
    thin_provisioned = "false"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "VM-WebServer-Dev"
        domain = "dnst.kz"
      }

      network_interface {
        ipv4_address = "172.31.22.48"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.31.22.1"
      dns_server_list = ["172.31.88.200"]
    }
  }
}

resource "vsphere_virtual_machine" "vm-10" {
  name             = "VM-WebServer-Prod"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 2048
  guest_id = "centos64Guest"

  network_interface {
    network_id = data.vsphere_network.net.id
  }

  disk {
    label = "disk0"
    size  = 40
    thin_provisioned = "false"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "VM-WebServer-Prod"
        domain = "dnst.kz"
      }

      network_interface {
        ipv4_address = "172.31.22.49"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.31.22.1"
      dns_server_list = ["172.31.88.200"]
    }
  }
}

resource "null_resource" "ansible" {
  depends_on = [vsphere_virtual_machine.vm-01, vsphere_virtual_machine.vm-02, vsphere_virtual_machine.vm-03, vsphere_virtual_machine.vm-04, vsphere_virtual_machine.vm-05, vsphere_virtual_machine.vm-06, vsphere_virtual_machine.vm-07,vsphere_virtual_machine.vm-08,vsphere_virtual_machine.vm-09,vsphere_virtual_machine.vm-10]
  provisioner "local-exec" {
    command = "ansible-playbook -b -i hosts.ini site.yml"
    working_dir = "ansible/"
  }
}

