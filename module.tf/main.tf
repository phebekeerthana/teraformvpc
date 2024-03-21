module "dev" {
    source = "github.com/phebekeerthana/teraformvpc/vpccustom"
    ami_id = "ami-0ba259e664698cbfc" 
    instance_type = "t2.nano"
    key_name = "terraform"
  
}