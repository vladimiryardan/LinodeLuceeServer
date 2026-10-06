output "server_id" {
  description = "Linode instance ID"
  value       = linode_instance.webserver.id
}

output "server_label" {
  description = "Linode instance label"
  value       = linode_instance.webserver.label
}

output "public_ipv4" {
  description = "Public IPv4 address"
  value       = tolist(linode_instance.webserver.ipv4)[0]
}

output "ssh_command" {
  description = "SSH command for the server"
  value       = "ssh root@${tolist(linode_instance.webserver.ipv4)[0]}"
}