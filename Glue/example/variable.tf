variable "dev_endpoint" {
    type = map(any)
    description = "(optional) describe your variable"
    default = {
      "demo-poc1" = {

      }
      "demo-poc2" = {
        
      }
    }
}
variable "raw_bucket" {
    type = string
    description = "(optional) describe your variable"
    default = "demo12145"
}
