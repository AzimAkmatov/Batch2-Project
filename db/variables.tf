variable "db_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "db_sg" {
  type = string
  description = "This is DB security group"
}

variable "db_name" {
  description = "Database name"
  default     = "mydb"
}
variable "db_user" {
  description = "Database user"
  default     = "admin"
}
variable "db_password" {
  description = "Database password"
  default     = "password"
}
variable "web_sg" {
  description = "List of security group IDs"
  type        = string
}