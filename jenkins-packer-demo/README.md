
####  These commands below insert to the 'Execute shell' block for the 'packer-demo' Jenkins project build

```
#####!/usr/bin/env bash -e -x
export AWS_DEFAULT_PROFILE=cr-labs-skill-up
ARTIFACT=`/usr/local/bin/packer build -machine-readable packer-demo.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
AMI_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo 'variable "APP_INSTANCE_AMI" { default = "'${AMI_ID}'" }' > amivar.tf
aws s3 cp amivar.tf s3://terraform-state-c29df1kjsadfkjb/amivar.tf 
```


####  These commands below insert to the 'Execute shell' block for the terraform-project Jenkins project build

```
export AWS_DEFAULT_PROFILE=cr-labs-skill-up
cd jenkins-packer-demo
aws s3 cp s3://terraform-state-c29df1kjsadfkjb/amivar.tf amivar.tf
touch mygenkey
touch mygenkey.pub
/usr/local/bin/terraform init
/usr/local/bin/terraform apply -auto-approve -var APP_INSTANCE_COUNT=1 -var PROFILE=cr-labs-skill-up -target aws_instance.app-instance
```