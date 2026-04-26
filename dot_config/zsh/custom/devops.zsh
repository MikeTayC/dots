####
# BAiCi - Devops Terminal Configs
####

###
# Set the default profile and login
# $ aws-vault login <profile_name>
###
alias av='aws-vault'
alias avl='aws-vault login'
alias ave='aws-vault exec'

###
# New User Setup - Set Local Alias
#
# https://blueacornici.atlassian.net/wiki/spaces/BLM/pages/5929041949/New+User+Setup#Set-Local-Alias
# Original version:
# ```
# export KUBECONFIG=$(find $HOMECONFIG/.kube/config.d -type f -print0 | xargs -0 -II echo -n I:)
# ``` 
# It prints all file paths in ~/.kube/config.d, separated by colons, all on a single line.
# 
# using ~/.config/.kube for config location
# Using a simplified/modified version (requires sed or gnu-sed on mac)
###
export KUBEDIR="$HOME/.config/.kube/config.d"
export KUBECONFIG=$(printf "%s:" "$KUBEDIR"/*(N) | sed 's/:$//')
alias kubed="cd $KUBEDIR"
alias cdevops="$ZSH_CUSTOM/devops.zsh"
###
# New User Setup - Pull Kubeconfig
# https://blueacornici.atlassian.net/wiki/spaces/BLM/pages/5929041949/New+User+Setup#Pull-Kubeconfig
# ```
# aws-vault exec <profile_name> -- aws --region=us-east-1 eks update-kubeconfig --name <cluster_name> --kubeconfig=$HOME/.kube/config.d/<cluster_alias> --alias <cluster_alias>
# ```
#
# This pulls down the cluster's kubeconfig. 
# <profile_name> should be defined in aws-vault setup eg blm-qa
# <cluster_name> should be either blm-prod-cluster or blm-qa-cluster depending on which cluster you are accessing
# <cluster_alias> can be whatever you like, but easy names like blm-prod and blm-qa are recommended.
###
function kubeconfig-pull() {
  if ! [ -z $1 ]; then
    local aws_profile=$1
  fi
  
  if ! [ -z $2 ]; then
    local cluster_name=$2
  else
    local cluster_name="$aws_profile-cluster"
  fi

  if ! [ -z $3 ]; then
    local cluster_alias=$3
  else
    local cluster_alias=$aws_profile
  fi

  if ! [ -z $aws_profile ]; then
    echo "profile_name: $aws_profile"
    echo "cluster_name: $cluster_name"
    echo "cluster_alias: $cluster_alias"
    echo 'pulling kubeconfig for us-east-1..'

    echo "Executing..\naws-vault exec $aws_profile -- aws --region=us-east-1 eks update-kubeconfig --name $cluster_name --kubeconfig=$KUBEDIR/$cluster_alias -- alias $cluster_alias"
   ave $aws_profile -- aws --region=us-east-1 eks update-kubeconfig --name $cluster_name --kubeconfig=$KUBEDIR/$cluster_alias --alias $cluster_alias
  fi
}


###
# Once set up, view the pods on this cluster:
# ```
# aws-vault exec <profile_name> -- kubectl get pods -n kube-system
# ```
###
function kube-pod() {
  if ! [ -z $1 ]; then
    echo "Executing..\naws-vault exec $1 -- kubectl get pods -n kube-system"
    ave $1 -- kubectl get pods -n kube-system
  else
    echo 'no profile_name (eg blm-qa)'
  fi 
}
