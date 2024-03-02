# update-nodegroups
A quick way to update all EKS managed nodegroups in an AWS region.

**NOTE**: This is a `bash` script that has limited functionality. This was made as a way to maintain EKS Clusters in a sandbox account. The purpose of this was to update all Managed Nodegroups with the latest EKS AMI. 

### Usage:
```
./update-nodegroups

# You can set this as an alias in your .bashrc or .zshrc

alias updateNodes="echo 'Updating all nodegroups in us-east-2'; bash ~/testing/update_nodegroups.sh"
```

You will need to modify the `$REGION` variable in the script to run this for a specific region. 

Alternatively, you can add this as a function to your `.bashrc` and run this with parameters for the `REGION`. See `update-nodegroups-function.sh`.
