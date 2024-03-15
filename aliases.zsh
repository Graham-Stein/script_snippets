# Fuzzyfinder for AWS Profiles
fzf_aws_prof() {
  export AWS_PROFILE=$(
    grep -e '^.profile' ~/.aws/config | awk -F"[][]" '{print $2}' |while read a p ; do echo "$p" ; done |
    fzf +s --tac
  ) || return
}
alias ap="fzf_aws_prof"

# History with fuzzy search, reverse order, not sorted
alias hg="history | fzf +s --tac"

# Get Parameter from AWS Param store
get_param () {
  echo "AWS PROFILE:"
  echo $AWS_PROFILE
  echo "PARAM STORE KEY:"
  echo $1
  echo $(aws ssm get-parameter --name=$1 | jq -r '.Parameter.Value')
}
alias gp="get_param"

# git
alias co="git checkout"

# general
alias ls="ls -lah"
alias who="echo $(whoami)"
alias ez="exec zsh"

# Docker
alias d="docker"
alias dc="docker compose"
alias dsp="docker system prune"

