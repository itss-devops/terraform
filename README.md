# terraform

1. Go to itss-devop account, Tokyo region.

2. Go to cloud9 and install terraform.
     ```
     $ curl https://release.hashicorp.com/terraform/0.12.5/terraform_0.12.5_linux_amd64.zip -0 
     $ unzip terraform_0.12.5_linux_amd64.zip 
     $ rm terraform_0.12.5_linux_amd64.zip 
     $ sudo mv terraform /usr/local/bin
    
3. Verify if Terraform has been installed
      ```
      $ terraform version
      
4. Make a directory under ~/environment/
      ```
      $ mkdir [your-folder-name]
