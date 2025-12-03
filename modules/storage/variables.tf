variable "location" { 
  type = string 
}

variable "rg_name" { 
  type = string 
}

variable "storage_name_prefix" { 
  type = string 
}

variable "index_html_path" { 
  type = string 
  default = "website/index.html" 
}

variable "error_html_path" { 
  type = string 
  default = "website/404.html" 
}