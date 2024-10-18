variable "region" {
  type = string
}

variable "env" {
  type = string
  default = "dev"
}

variable "app" {
  type = string
  default = "spring-boot-app"
}

variable "eks_cluster_name" {
  type = string
}

variable "eks_cluster_version" {
  type = string
}