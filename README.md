# Morpheus

This is Morpheus's automation implementation, like Terraform, Shell Script, etc.

If you want to test these script, you can log in morpheus vm as below:
IP: 20.6.0.150
Username: root
Password: root

and the files in script are already prepare on this vm, so you can running these code quickly.

In the shell script:
1. yum-repo-and-morpheus-install.sh, this file is using for Offline install morpheus on RHEL 7
2. create-virtual-image.sh, this file is using for create virtual image with Morpheus function "Virtual Image", and you will need to create blueprint by manual
   (will automatic soon.) 
