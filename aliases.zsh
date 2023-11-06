# Fuzzyfinder for AWS Profiles
fzf_aws_prof() {
  export AWS_PROFILE=$(
    grep -e '^.profile' ~/.aws/config | awk -F"[][]" '{print $2}' |while read a p ; do echo "$p" ; done |
    fzf +s --tac
  ) || return
}
alias ap="fzf_aws_prof"

# Get Parameter from AWS Param store
get_param () {
  echo "AWS PROFILE:"
  echo $AWS_PROFILE
  echo "PARAM STORE KEY:"
  echo $1
  echo $(aws ssm get-parameter --name=$1 | jq -r '.Parameter.Value')
}
alias gp="get_param"
