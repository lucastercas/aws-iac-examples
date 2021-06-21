variable "key_name" {
  type = string
}

variable "control_plane_ports" {
  type = list(number)
  default = [
    6443,  # api server
    10250, # kubelet api
    10251, # kubescheduler api
    10252, # kube-controller api
    10255  # kubelet api for read-only access with no authentication
  ]
}

variable "etcd_ports" {
  type    = list(number)
  default = [2379, 230]
}

variable "worker_ports" {
  type = list(number)
  default = [
    10250, # kubelet api
    10255  # kubelet api for read-only access with no authentication
  ]
}

# weave cni
variable "cni_ports" {
  type = list(number)
  default = [
    6783, 6784
  ]
}
