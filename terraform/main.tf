resource "linode_instance" "webserver" {
  label  = var.instance_label
  image  = var.image
  region = var.region
  type   = var.instance_type

  authorized_keys = [
    file(pathexpand(var.ssh_public_key_path))
  ]

  tags = [
    "terraform",
    "ansible",
    "lucee",
    "webserver"
  ]
}

resource "linode_firewall" "webserver" {
  label = "${var.instance_label}-firewall"

  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"

  inbound {
    label    = "SSH"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "HTTP"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "HTTPS"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "443"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  linodes = [
    linode_instance.webserver.id
  ]
}
