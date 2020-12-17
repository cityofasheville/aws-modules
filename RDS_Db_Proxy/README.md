# City of Asheville Infrastructure

**NOTE: THIS MODULE IS STILL VERY EXPERIMENTAL**
================================================

## What is in this module?
This is a base module for deploying an RDS DB Proxy for an RDS instance.

## How do you use this module?

Import this module into your Terraform or Terragrunt plan.

Be sure to specify a tag on production systems or updates to this repository may cause unexpected consequences.

## Known Issues / Work in Progress

There is still functionality to add.

* It will not destroy correctly due to the way the security groups are created and attached. This is a shared problem with Terraform. Until a solution is found, the Instance many need to be deleted manually, then the destroy plans run to remove the remaining resources.
* Deployed 
* Some resource identifiers are hard coded, specifically in the modules, Roles and Subnets. 

