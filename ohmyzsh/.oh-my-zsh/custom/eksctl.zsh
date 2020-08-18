#compdef _eksctl eksctl


function _eksctl {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "completion:Generates shell completion scripts for bash, zsh or fish"
      "create:Create resource(s)"
      "delete:Delete resource(s)"
      "drain:Drain resource(s)"
      "enable:Enable features in a cluster"
      "generate:Generate gitops manifests"
      "get:Get resource(s)"
      "help:Help about any command"
      "scale:Scale resources(s)"
      "set:Set values"
      "unset:Unset values"
      "update:Update resource(s)"
      "upgrade:Upgrade resource(s)"
      "utils:Various utils"
      "version:Output the version of eksctl"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  completion)
    _eksctl_completion
    ;;
  create)
    _eksctl_create
    ;;
  delete)
    _eksctl_delete
    ;;
  drain)
    _eksctl_drain
    ;;
  enable)
    _eksctl_enable
    ;;
  generate)
    _eksctl_generate
    ;;
  get)
    _eksctl_get
    ;;
  help)
    _eksctl_help
    ;;
  scale)
    _eksctl_scale
    ;;
  set)
    _eksctl_set
    ;;
  unset)
    _eksctl_unset
    ;;
  update)
    _eksctl_update
    ;;
  upgrade)
    _eksctl_upgrade
    ;;
  utils)
    _eksctl_utils
    ;;
  version)
    _eksctl_version
    ;;
  esac
}


function _eksctl_completion {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "bash:Generates bash completion scripts"
      "fish:Generates fish completion scripts"
      "zsh:Generates zsh completion scripts"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  bash)
    _eksctl_completion_bash
    ;;
  fish)
    _eksctl_completion_fish
    ;;
  zsh)
    _eksctl_completion_zsh
    ;;
  esac
}

function _eksctl_completion_bash {
  _arguments \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_completion_fish {
  _arguments \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_completion_zsh {
  _arguments \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}


function _eksctl_create {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "cluster:Create a cluster"
      "fargateprofile:Create a Fargate profile"
      "iamidentitymapping:Create an IAM identity mapping"
      "iamserviceaccount:Create an iamserviceaccount - AWS IAM role bound to a Kubernetes service account"
      "nodegroup:Create a nodegroup"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  cluster)
    _eksctl_create_cluster
    ;;
  fargateprofile)
    _eksctl_create_fargateprofile
    ;;
  iamidentitymapping)
    _eksctl_create_iamidentitymapping
    ;;
  iamserviceaccount)
    _eksctl_create_iamserviceaccount
    ;;
  nodegroup)
    _eksctl_create_nodegroup
    ;;
  esac
}

function _eksctl_create_cluster {
  _arguments \
    '--alb-ingress-access[enable full access for alb-ingress-controller]' \
    '--appmesh-access[enable full access to AppMesh]' \
    '--appmesh-preview-access[enable full access to AppMesh Preview]' \
    '--asg-access[enable IAM policy for cluster-autoscaler]' \
    '--authenticator-role-arn[AWS IAM role to assume for authenticator]:' \
    '--auto-kubeconfig[save kubeconfig file by cluster name, e.g. "/home/jeewangue/.kube/eksctl/clusters/amazing-mushroom-1594099051"]' \
    '--cfn-role-arn[IAM role used by CloudFormation to call AWS API on your behalf]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '--external-dns-access[enable IAM policy for external-dns]' \
    '--fargate[Create a Fargate profile scheduling pods in the default and kube-system namespaces onto Fargate]' \
    '--full-ecr-access[enable full access to ECR]' \
    '--install-neuron-plugin[Install Neuron plugin for Inferentia nodes]' \
    '--install-vpc-controllers[Install VPC controller that'\''s required for Windows workloads]' \
    '--instance-name[Overrides the default instance'\''s name. It can be used in combination with the instance-prefix flag.]:' \
    '--instance-prefix[Add a prefix value in front of the instance'\''s name.]:' \
    '--kubeconfig[path to write kubeconfig (incompatible with --auto-kubeconfig)]:' \
    '--managed[Create EKS-managed nodegroup]' \
    '--max-pods-per-node[maximum number of pods per node (set automatically if unspecified)]:' \
    '(-n --name)'{-n,--name}'[EKS cluster name (generated if unspecified, e.g. "amazing-mushroom-1594099051")]:' \
    '--node-ami[Advanced use cases only. If '\''ssm'\'' is supplied (default) then eksctl will use SSM Parameter; if '\''auto'\'' is supplied then eksctl will automatically set the AMI based on version/region/instance type; if static is supplied (deprecated), then static AMIs will be used; if any other value is supplied it will override the AMI to use for the nodes. Use with extreme care.]:' \
    '--node-ami-family[Advanced use cases only. If '\''AmazonLinux2'\'' is supplied (default), then eksctl will use the official AWS EKS AMIs (Amazon Linux 2); if '\''Ubuntu1804'\'' is supplied, then eksctl will use the official Canonical EKS AMIs (Ubuntu 18.04).]:' \
    '--node-labels[Extra labels to add when registering the nodes in the nodegroup. List of comma separated KV pairs "k1=v1,k2=v2"]:' \
    '(-P --node-private-networking)'{-P,--node-private-networking}'[whether to make nodegroup networking private]' \
    '*--node-security-groups[Attach additional security groups to nodes, so that it can be used to allow extra ingress/egress access from/to pods]:' \
    '(-t --node-type)'{-t,--node-type}'[node instance type]:' \
    '--node-volume-size[node volume size in GB]:' \
    '--node-volume-type[node volume type (valid options: gp2, io1, sc1, st1)]:' \
    '*--node-zones[(inherited from the cluster if unspecified)]:' \
    '--nodegroup-name[name of the nodegroup (generated if unspecified, e.g. "ng-6742c3eb")]:' \
    '(-N --nodes)'{-N,--nodes}'[total number of nodes (for a static ASG)]:' \
    '(-M --nodes-max)'{-M,--nodes-max}'[maximum nodes in ASG]:' \
    '(-m --nodes-min)'{-m,--nodes-min}'[minimum nodes in ASG]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--set-kubeconfig-context[if true then current-context will be set in kubeconfig; if a context is already set then it will be overwritten]' \
    '--ssh-access[control SSH access for nodes. Uses ~/.ssh/id_rsa.pub as default key path if enabled]' \
    '--ssh-public-key[SSH public key to use for nodes (import from local path, or use existing EC2 key pair)]:' \
    '--tags[Used to tag the AWS resources. List of comma separated KV pairs "k1=v1,k2=v2"]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '--version[Kubernetes version (valid options: 1.14, 1.15, 1.16)]:' \
    '--vpc-cidr[global CIDR to use for VPC]:' \
    '--vpc-from-kops-cluster[re-use VPC from a given kops cluster]:' \
    '--vpc-nat-mode[VPC NAT mode, valid options: HighlyAvailable, Single, Disable]:' \
    '*--vpc-private-subnets[re-use private subnets of an existing VPC]:' \
    '*--vpc-public-subnets[re-use public subnets of an existing VPC]:' \
    '--without-nodegroup[if set, initial nodegroup will not be created]' \
    '--write-kubeconfig[toggle writing of kubeconfig]' \
    '*--zones[(auto-select if unspecified)]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_create_fargateprofile {
  _arguments \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-l --labels)'{-l,--labels}'[Kubernetes selector labels of the workloads to schedule on Fargate. List of comma separated KV pairs "k1=v1,k2=v2"]:' \
    '--name[Fargate profile'\''s name]:' \
    '--namespace[Kubernetes namespace of the workloads to schedule on Fargate]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '(-t --tags)'{-t,--tags}'[Used to tag the AWS resources. List of comma separated KV pairs "k1=v1,k2=v2"]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_create_iamidentitymapping {
  _arguments \
    '--arn[ARN of the IAM role or user to create]:' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '*--group[Group within Kubernetes to which IAM role is mapped]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '--username[User name within Kubernetes to map to IAM role]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_create_iamserviceaccount {
  _arguments \
    '--approve[Apply the changes]' \
    '*--attach-policy-arn[ARN of the policy where to create the iamserviceaccount]:' \
    '--cfn-role-arn[IAM role used by CloudFormation to call AWS API on your behalf]:' \
    '--cluster[name of the EKS cluster to add the iamserviceaccount to]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '*--exclude[iamserviceaccounts to exclude (list of globs), e.g.: '\''default/s3-reader,*/dynamo-*'\'']:' \
    '*--include[iamserviceaccounts to include (list of globs), e.g.: '\''default/s3-reader,*/dynamo-*'\'']:' \
    '--name[name of the iamserviceaccount to create]:' \
    '--namespace[namespace where to create the iamserviceaccount]:' \
    '--override-existing-serviceaccounts[create IAM roles for existing serviceaccounts and update the serviceaccount]' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--tags[Used to tag the IAM role. List of comma separated KV pairs "k1=v1,k2=v2"]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_create_nodegroup {
  _arguments \
    '--alb-ingress-access[enable full access for alb-ingress-controller]' \
    '--appmesh-access[enable full access to AppMesh]' \
    '--appmesh-preview-access[enable full access to AppMesh Preview]' \
    '--asg-access[enable IAM policy for cluster-autoscaler]' \
    '--cfn-role-arn[IAM role used by CloudFormation to call AWS API on your behalf]:' \
    '--cluster[name of the EKS cluster to add the nodegroup to]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '*--exclude[nodegroups to exclude (list of globs), e.g.: '\''ng-team-?,prod-*'\'']:' \
    '--external-dns-access[enable IAM policy for external-dns]' \
    '--full-ecr-access[enable full access to ECR]' \
    '*--include[nodegroups to include (list of globs), e.g.: '\''ng-team-?,prod-*'\'']:' \
    '--install-neuron-plugin[Install Neuron plugin for Inferentia nodes]' \
    '--instance-name[Overrides the default instance'\''s name. It can be used in combination with the instance-prefix flag.]:' \
    '--instance-prefix[Add a prefix value in front of the instance'\''s name.]:' \
    '--managed[Create EKS-managed nodegroup]' \
    '--max-pods-per-node[maximum number of pods per node (set automatically if unspecified)]:' \
    '(-n --name)'{-n,--name}'[name of the new nodegroup (generated if unspecified, e.g. "ng-f4054775")]:' \
    '--node-ami[Advanced use cases only. If '\''ssm'\'' is supplied (default) then eksctl will use SSM Parameter; if '\''auto'\'' is supplied then eksctl will automatically set the AMI based on version/region/instance type; if static is supplied (deprecated), then static AMIs will be used; if any other value is supplied it will override the AMI to use for the nodes. Use with extreme care.]:' \
    '--node-ami-family[Advanced use cases only. If '\''AmazonLinux2'\'' is supplied (default), then eksctl will use the official AWS EKS AMIs (Amazon Linux 2); if '\''Ubuntu1804'\'' is supplied, then eksctl will use the official Canonical EKS AMIs (Ubuntu 18.04).]:' \
    '--node-labels[Extra labels to add when registering the nodes in the nodegroup. List of comma separated KV pairs "k1=v1,k2=v2"]:' \
    '(-P --node-private-networking)'{-P,--node-private-networking}'[whether to make nodegroup networking private]' \
    '*--node-security-groups[Attach additional security groups to nodes, so that it can be used to allow extra ingress/egress access from/to pods]:' \
    '(-t --node-type)'{-t,--node-type}'[node instance type]:' \
    '--node-volume-size[node volume size in GB]:' \
    '--node-volume-type[node volume type (valid options: gp2, io1, sc1, st1)]:' \
    '*--node-zones[(inherited from the cluster if unspecified)]:' \
    '(-N --nodes)'{-N,--nodes}'[total number of nodes (for a static ASG)]:' \
    '(-M --nodes-max)'{-M,--nodes-max}'[maximum nodes in ASG]:' \
    '(-m --nodes-min)'{-m,--nodes-min}'[minimum nodes in ASG]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--ssh-access[control SSH access for nodes. Uses ~/.ssh/id_rsa.pub as default key path if enabled]' \
    '--ssh-public-key[SSH public key to use for nodes (import from local path, or use existing EC2 key pair)]:' \
    '--tags[Used to tag the AWS resources. List of comma separated KV pairs "k1=v1,k2=v2"]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '--update-auth-configmap[Add nodegroup IAM role to aws-auth configmap]' \
    '--version[Kubernetes version (valid options: 1.14, 1.15, 1.16) [for nodegroups "auto" and "latest" can be used to automatically inherit version from the control plane or force latest]]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}


function _eksctl_delete {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "cluster:Delete a cluster"
      "fargateprofile:Delete Fargate profile"
      "iamidentitymapping:Delete a IAM identity mapping"
      "iamserviceaccount:Delete an IAM service account"
      "nodegroup:Delete a nodegroup"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  cluster)
    _eksctl_delete_cluster
    ;;
  fargateprofile)
    _eksctl_delete_fargateprofile
    ;;
  iamidentitymapping)
    _eksctl_delete_iamidentitymapping
    ;;
  iamserviceaccount)
    _eksctl_delete_iamserviceaccount
    ;;
  nodegroup)
    _eksctl_delete_nodegroup
    ;;
  esac
}

function _eksctl_delete_cluster {
  _arguments \
    '--cfn-role-arn[IAM role used by CloudFormation to call AWS API on your behalf]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-n --name)'{-n,--name}'[EKS cluster name]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-w --wait)'{-w,--wait}'[wait for deletion of all resources before exiting]' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_delete_fargateprofile {
  _arguments \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '--name[Fargate profile'\''s name]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-w --wait)'{-w,--wait}'[wait for wait for the deletion of the Fargate profile, which may take from a couple seconds to a couple minutes. before exiting]' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_delete_iamidentitymapping {
  _arguments \
    '--all[Delete all matching mappings instead of just one]' \
    '--arn[ARN of the IAM role or user to create]:' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_delete_iamserviceaccount {
  _arguments \
    '--approve[Apply the changes]' \
    '--cfn-role-arn[IAM role used by CloudFormation to call AWS API on your behalf]:' \
    '--cluster[name of the EKS cluster to delete the iamserviceaccount from]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '*--exclude[iamserviceaccounts to exclude (list of globs), e.g.: '\''default/s3-reader,*/dynamo-*'\'']:' \
    '*--include[iamserviceaccounts to include (list of globs), e.g.: '\''default/s3-reader,*/dynamo-*'\'']:' \
    '--name[name of the iamserviceaccount to delete]:' \
    '--namespace[namespace where to delete the iamserviceaccount]:' \
    '--only-missing[Only delete nodegroups that are not defined in the given config file]' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-w --wait)'{-w,--wait}'[wait for deletion of all resources before exiting]' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_delete_nodegroup {
  _arguments \
    '--approve[Apply the changes]' \
    '--cfn-role-arn[IAM role used by CloudFormation to call AWS API on your behalf]:' \
    '--cluster[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '--drain[Drain and cordon all nodes in the nodegroup before deletion]' \
    '*--exclude[nodegroups to exclude (list of globs), e.g.: '\''ng-team-?,prod-*'\'']:' \
    '*--include[nodegroups to include (list of globs), e.g.: '\''ng-team-?,prod-*'\'']:' \
    '(-n --name)'{-n,--name}'[Name of the nodegroup to delete]:' \
    '--only-missing[Only delete nodegroups that are not defined in the given config file]' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '--update-auth-configmap[Remove nodegroup IAM role from aws-auth configmap]' \
    '(-w --wait)'{-w,--wait}'[wait for deletion of all resources before exiting]' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}


function _eksctl_drain {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "nodegroup:Cordon and drain a nodegroup"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  nodegroup)
    _eksctl_drain_nodegroup
    ;;
  esac
}

function _eksctl_drain_nodegroup {
  _arguments \
    '--approve[Apply the changes]' \
    '--cfn-role-arn[IAM role used by CloudFormation to call AWS API on your behalf]:' \
    '--cluster[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '*--exclude[nodegroups to exclude (list of globs), e.g.: '\''ng-team-?,prod-*'\'']:' \
    '*--include[nodegroups to include (list of globs), e.g.: '\''ng-team-?,prod-*'\'']:' \
    '(-n --name)'{-n,--name}'[Name of the nodegroup to delete]:' \
    '--only-missing[Only drain nodegroups that are not defined in the given config file]' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '--undo[Uncordone the nodegroup]' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}


function _eksctl_enable {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "profile:Commits the components from the selected Quick Start profile to the destination repository."
      "repo:Set up a repo for gitops, installing Flux in the cluster and initializing its manifests in the specified Git repository"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  profile)
    _eksctl_enable_profile
    ;;
  repo)
    _eksctl_enable_repo
    ;;
  esac
}

function _eksctl_enable_profile {
  _arguments \
    '--cluster[name of the EKS cluster to enable this Quick Start profile on]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '--git-branch[Git branch to be used for GitOps]:' \
    '--git-email[Email to use as Git committer]:' \
    '--git-private-ssh-key-path[Optional path to the private SSH key to use with Git, e.g. ~/.ssh/id_rsa]:' \
    '--git-url[SSH URL of the Git repository to be used for GitOps, e.g. git@github.com:<github_org>/<repo_name>]:' \
    '--git-user[Username to use as Git committer]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '--profile-revision[revision of the Quick Start profile.]:' \
    '--profile-source[name or URL of the Quick Start profile. For example, app-dev.]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_enable_repo {
  _arguments \
    '--cluster[name of the EKS cluster to enable gitops on]:' \
    '--commit-operator-manifests[Commit and push Flux manifests to the Git repo on install]' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '--git-branch[Git branch to be used for GitOps]:' \
    '--git-email[Email to use as Git committer]:' \
    '--git-flux-subdir[Directory within the Git repository where to commit the Flux manifests]:' \
    '--git-label[Git label to keep track of Flux'\''s sync progress; this is equivalent to overriding --git-sync-tag and --git-notes-ref in Flux]:' \
    '*--git-paths[Relative paths within the Git repo for Flux to locate Kubernetes manifests]:' \
    '--git-private-ssh-key-path[Optional path to the private SSH key to use with Git, e.g. ~/.ssh/id_rsa]:' \
    '--git-url[SSH URL of the Git repository to be used for GitOps, e.g. git@github.com:<github_org>/<repo_name>]:' \
    '--git-user[Username to use as Git committer]:' \
    '--namespace[Cluster namespace where to install Flux and the Helm Operator]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '--read-only[Configure Flux in read-only mode and create the deploy key as read-only (Github only)]' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '--with-helm[Install the Helm Operator]' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}


function _eksctl_generate {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "profile:Generate a gitops profile"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  profile)
    _eksctl_generate_profile
    ;;
  esac
}

function _eksctl_generate_profile {
  _arguments \
    '--cluster[name of the EKS cluster to enable gitops on]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '--profile-path[path to generate the profile in. Defaults to ./<quickstart-repo-name>]:' \
    '--profile-revision[revision of the Quick Start profile.]:' \
    '--profile-source[name or URL of the Quick Start profile. For example, app-dev.]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}


function _eksctl_get {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "cluster:Get cluster(s)"
      "fargateprofile:Get Fargate profile(s)"
      "iamidentitymapping:Get IAM identity mapping(s)"
      "iamserviceaccount:Get iamserviceaccount(s)"
      "labels:Get nodegroup labels"
      "nodegroup:Get nodegroup(s)"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  cluster)
    _eksctl_get_cluster
    ;;
  fargateprofile)
    _eksctl_get_fargateprofile
    ;;
  iamidentitymapping)
    _eksctl_get_iamidentitymapping
    ;;
  iamserviceaccount)
    _eksctl_get_iamserviceaccount
    ;;
  labels)
    _eksctl_get_labels
    ;;
  nodegroup)
    _eksctl_get_nodegroup
    ;;
  esac
}

function _eksctl_get_cluster {
  _arguments \
    '(-A --all-regions)'{-A,--all-regions}'[List clusters across all supported regions]' \
    '--chunk-size[return large lists in chunks rather than all at once, pass 0 to disable]:' \
    '(-n --name)'{-n,--name}'[EKS cluster name]:' \
    '(-o --output)'{-o,--output}'[specifies the output format (valid option: table, json, yaml)]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_get_fargateprofile {
  _arguments \
    '--chunk-size[return large lists in chunks rather than all at once, pass 0 to disable]:' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '--name[Fargate profile'\''s name]:' \
    '(-o --output)'{-o,--output}'[specifies the output format (valid option: table, json, yaml)]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_get_iamidentitymapping {
  _arguments \
    '--arn[ARN of the IAM role or user to create]:' \
    '--chunk-size[return large lists in chunks rather than all at once, pass 0 to disable]:' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-o --output)'{-o,--output}'[specifies the output format (valid option: table, json, yaml)]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_get_iamserviceaccount {
  _arguments \
    '--chunk-size[return large lists in chunks rather than all at once, pass 0 to disable]:' \
    '--cluster[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '--name[name of the iamserviceaccount to delete]:' \
    '--namespace[namespace where to delete the iamserviceaccount]:' \
    '(-o --output)'{-o,--output}'[specifies the output format (valid option: table, json, yaml)]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_get_labels {
  _arguments \
    '--cluster[EKS cluster name]:' \
    '(-n --nodegroup)'{-n,--nodegroup}'[Nodegroup name]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_get_nodegroup {
  _arguments \
    '--chunk-size[return large lists in chunks rather than all at once, pass 0 to disable]:' \
    '--cluster[EKS cluster name]:' \
    '(-n --name)'{-n,--name}'[Name of the nodegroup]:' \
    '(-o --output)'{-o,--output}'[specifies the output format (valid option: table, json, yaml)]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_help {
  _arguments \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}


function _eksctl_scale {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "nodegroup:Scale a nodegroup"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  nodegroup)
    _eksctl_scale_nodegroup
    ;;
  esac
}

function _eksctl_scale_nodegroup {
  _arguments \
    '--cfn-role-arn[IAM role used by CloudFormation to call AWS API on your behalf]:' \
    '--cluster[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-n --name)'{-n,--name}'[Name of the nodegroup to scale]:' \
    '(-N --nodes)'{-N,--nodes}'[desired number of nodes (required)]:' \
    '(-M --nodes-max)'{-M,--nodes-max}'[maximum number of nodes]:' \
    '(-m --nodes-min)'{-m,--nodes-min}'[minimum number of nodes]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}


function _eksctl_set {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "labels:Create or overwrite labels"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  labels)
    _eksctl_set_labels
    ;;
  esac
}

function _eksctl_set_labels {
  _arguments \
    '--cluster[EKS cluster name]:' \
    '(-l --labels)'{-l,--labels}'[Labels. List of comma separated KV pairs "k1=v1,k2=v2"]:' \
    '(-n --nodegroup)'{-n,--nodegroup}'[Nodegroup name]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}


function _eksctl_unset {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "labels:Create removeLabels"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  labels)
    _eksctl_unset_labels
    ;;
  esac
}

function _eksctl_unset_labels {
  _arguments \
    '--cluster[EKS cluster name]:' \
    '(*-l *--labels)'{\*-l,\*--labels}'[List of labels to remove]:' \
    '(-n --nodegroup)'{-n,--nodegroup}'[Nodegroup name]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}


function _eksctl_update {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "cluster:DEPRECATED: use 'upgrade cluster' instead. Upgrade control plane to the next version. "
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  cluster)
    _eksctl_update_cluster
    ;;
  esac
}

function _eksctl_update_cluster {
  _arguments \
    '--approve[Apply the changes]' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-n --name)'{-n,--name}'[EKS cluster name]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '--version[Kubernetes version (valid options: 1.14, 1.15, 1.16)]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}


function _eksctl_upgrade {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "cluster:Upgrade control plane to the next version"
      "nodegroup:Upgrade nodegroup"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  cluster)
    _eksctl_upgrade_cluster
    ;;
  nodegroup)
    _eksctl_upgrade_nodegroup
    ;;
  esac
}

function _eksctl_upgrade_cluster {
  _arguments \
    '--approve[Apply the changes]' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-n --name)'{-n,--name}'[EKS cluster name]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '--version[Kubernetes version (valid options: 1.14, 1.15, 1.16)]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_upgrade_nodegroup {
  _arguments \
    '--cluster[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '--kubernetes-version[Kubernetes version]:' \
    '--name[Nodegroup name]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-w --wait)'{-w,--wait}'[wait for nodegroup upgrade to complete before exiting]' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}


function _eksctl_utils {
  local -a commands

  _arguments -C \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "associate-iam-oidc-provider:Setup IAM OIDC provider for a cluster to enable IAM roles for pods"
      "describe-stacks:Describe CloudFormation stack for a given cluster"
      "install-vpc-controllers:Install Windows VPC controller to support running Windows workloads"
      "nodegroup-health:Get nodegroup health for a managed node"
      "schema:Output the ClusterConfig JSON Schema"
      "set-public-access-cidrs:Update public access CIDRs"
      "update-aws-node:Update aws-node add-on to latest released version"
      "update-cluster-endpoints:Update Kubernetes API endpoint access configuration"
      "update-cluster-logging:Update cluster logging configuration"
      "update-cluster-stack:DEPRECATED: Use 'eksctl update cluster' instead"
      "update-coredns:Update coredns add-on to ensure image matches the standard Amazon EKS version"
      "update-kube-proxy:Update kube-proxy add-on to ensure image matches Kubernetes control plane version"
      "update-legacy-subnet-settings:Update the configuration of the cluster's public subnets with MapPublicIpOnLaunch enabled"
      "write-kubeconfig:Write kubeconfig file for a given cluster"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  associate-iam-oidc-provider)
    _eksctl_utils_associate-iam-oidc-provider
    ;;
  describe-stacks)
    _eksctl_utils_describe-stacks
    ;;
  install-vpc-controllers)
    _eksctl_utils_install-vpc-controllers
    ;;
  nodegroup-health)
    _eksctl_utils_nodegroup-health
    ;;
  schema)
    _eksctl_utils_schema
    ;;
  set-public-access-cidrs)
    _eksctl_utils_set-public-access-cidrs
    ;;
  update-aws-node)
    _eksctl_utils_update-aws-node
    ;;
  update-cluster-endpoints)
    _eksctl_utils_update-cluster-endpoints
    ;;
  update-cluster-logging)
    _eksctl_utils_update-cluster-logging
    ;;
  update-cluster-stack)
    _eksctl_utils_update-cluster-stack
    ;;
  update-coredns)
    _eksctl_utils_update-coredns
    ;;
  update-kube-proxy)
    _eksctl_utils_update-kube-proxy
    ;;
  update-legacy-subnet-settings)
    _eksctl_utils_update-legacy-subnet-settings
    ;;
  write-kubeconfig)
    _eksctl_utils_write-kubeconfig
    ;;
  esac
}

function _eksctl_utils_associate-iam-oidc-provider {
  _arguments \
    '--approve[Apply the changes]' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_describe-stacks {
  _arguments \
    '--all[include deleted stacks]' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '--events[include stack events]' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '--trail[lookup CloudTrail events for the cluster]' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_install-vpc-controllers {
  _arguments \
    '--approve[Apply the changes]' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_nodegroup-health {
  _arguments \
    '--cluster[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-n --name)'{-n,--name}'[Name of the nodegroup]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_schema {
  _arguments \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_set-public-access-cidrs {
  _arguments \
    '--approve[Apply the changes]' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_update-aws-node {
  _arguments \
    '--approve[Apply the changes]' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_update-cluster-endpoints {
  _arguments \
    '--approve[Apply the changes]' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '--private-access[access for private (VPC) clients]' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '--public-access[access for public clients]' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_update-cluster-logging {
  _arguments \
    '--approve[Apply the changes]' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '*--disable-types[Log types to be disabled, the rest will be disabled. Supported log types: (all, none, api, audit, authenticator, controllerManager, scheduler)]:' \
    '*--enable-types[Log types to be enabled. Supported log types: (all, none, api, audit, authenticator, controllerManager, scheduler)]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_update-cluster-stack {
  _arguments \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_update-coredns {
  _arguments \
    '--approve[Apply the changes]' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_update-kube-proxy {
  _arguments \
    '--approve[Apply the changes]' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-f --config-file)'{-f,--config-file}'[load configuration from a file (or stdin if set to '\''-'\'')]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_update-legacy-subnet-settings {
  _arguments \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_utils_write-kubeconfig {
  _arguments \
    '--authenticator-role-arn[AWS IAM role to assume for authenticator]:' \
    '--auto-kubeconfig[save kubeconfig file by cluster name, e.g. "/home/jeewangue/.kube/eksctl/clusters/<name>"]' \
    '(-c --cluster)'{-c,--cluster}'[EKS cluster name]:' \
    '--kubeconfig[path to write kubeconfig (incompatible with --auto-kubeconfig)]:' \
    '(-p --profile)'{-p,--profile}'[AWS credentials profile to use (overrides the AWS_PROFILE environment variable)]:' \
    '(-r --region)'{-r,--region}'[AWS region]:' \
    '--set-kubeconfig-context[if true then current-context will be set in kubeconfig; if a context is already set then it will be overwritten]' \
    '--timeout[maximum waiting time for any long-running operation]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

function _eksctl_version {
  _arguments \
    '(-o --output)'{-o,--output}'[specifies the output format (valid option: json)]:' \
    '(-C --color)'{-C,--color}'[toggle colorized logs (valid options: true, false, fabulous)]:' \
    '(-h --help)'{-h,--help}'[help for this command]' \
    '(-v --verbose)'{-v,--verbose}'[set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging]:'
}

