variable "user_pool_name" {
  description = "The name of the user pool"
  type        = string
}

variable "client_name" {
  description = "The name of the client"
  type        = string
}

variable "callback_urls" {
  description = "The callback urls"
  type        = list(string)
  default     = ["http://localhost:3000"]
}
