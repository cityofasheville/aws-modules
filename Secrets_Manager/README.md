# City of Asheville Infrastructure

**NOTE: THIS MODULE IS STILL VERY EXPERIMENTAL**
================================================

## What is in this module?
This is a base module for deploying a secret in AWS Secrets Manager.

## How do you use this module?

Import this module into your Terraform or Terragrunt plan.

Be sure to specify a tag on production systems or updates to this repository may cause unexpected consequences.

## Known Issues / Work in Progress

There is still functionality to add.

* This module is set up right not to store RDS credentials. It needs to be modified to accept/store more generic values before being used for other secrets.
* Some resource identifiers are hard coded, specifically in the modules, Roles and Subnets. 
