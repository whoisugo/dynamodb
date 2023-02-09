terraform {
 required_providers {
   aws = {
     source = "hashicorp/aws"
   }
 }
}
    
provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "move-money-contributions-stage-devint" { 
   name = "move-money-contributions-stage-devint" 
   billing_mode = "PROVISIONED" 
   read_capacity = "30" 
   write_capacity = "30" 
   attribute { 
      name = "CmRequestId" 
      type = "S" 
   } 
   hash_key = "CmRequestId" 
   ttl { 
     enabled = true
     attribute_name = "expiryPeriod"  
   }
   point_in_time_recovery { enabled = true } 
   server_side_encryption { enabled = true } 
   lifecycle { ignore_changes = [ "write_capacity", "read_capacity" ] }
   
} 

