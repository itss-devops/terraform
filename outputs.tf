output "public_dns" {
  value       = aws_instance.[nameofyourinstance].public_dns
  description = "The public IP of the web server"
}
