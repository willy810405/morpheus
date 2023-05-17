# Morpheus

This is Morpheus automation implementation, like Terraform, Shell Script, etc.

If you want to test these script, you can log in morpheus vm as below:
IP: 20.6.0.150
Username: root
Password: root

and the files in script are already prepare on this vm, so you can running these code quickly.

In the shell script:
1. yum-repo-and-morpheus-install.sh, this file is using for Offline install morpheus on RHEL 7

2. create-virtual-image.sh, this file is using for create virtual image with Morpheus function "Virtual Image", and you will need to create blueprint by manual
   (will automatic soon.)
 
   2023/05/17 Update:

   The virtual image flow is now split into 5 scripts(/morpheus/shell/create-virtual-image-flow) because in some environments can't install jq, I don't want to process the output of ID's neither lol. Maybe someday I will merge into jq script (create-virtual-image.sh) 

   If you want to use these scripts, you will need to create an "ACCESS TOKEN", you can following the step as below:

   a. Login to Morpheus UI

   b. Click the name you login, and click "USER SETTING"

   c. Click "API ACCESS" on the left

   d. See the "morph-api" and click the "Action" -> "Generate"

   e. Copy the ACCESS TOKEN and enjoy the scripts

3. ansible folder, the resource is from https://github.com/cuxtud/morpheus-ansible2/
