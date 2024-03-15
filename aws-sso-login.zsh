# Colours for output https://dev.to/ifenna__/adding-colors-to-bash-scripts-48g4
green () { printf "\e[32m" ; "$@" ; printf "\e[0m"; }
dk_green () { printf "\e[38;5;35m" ; "$@" ; printf "\e[0m"; } # 256 colours https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
blue () { printf "\e[94m" ; "$@" ; printf "\e[0m"; }
red () { printf "\e[31m" ; "$@" ; printf "\e[0m"; }
bold_red () { printf "\e[1m\e[31m" ; "$@" ; printf "\e[0m"; }
grey () { printf "\e[37m" ; "$@" ; printf "\e[0m"; }
dk_grey () { printf "\e[90m" ; "$@" ; printf "\e[0m"; }
lt_yellow () { printf "\e[33m" ; "$@" ; printf "\e[0m"; }

check_sso_status() {
# Check SSO status https://stackoverflow.com/questions/73029532/how-to-check-if-aws-cli-sso-is-logged-in
dk_grey echo "Checking SSO status"
SSO_ACCOUNT=$(aws sts get-caller-identity --query "Account" --profile your-aws-profile --no-cli-auto-prompt)
if [ ${#SSO_ACCOUNT} -ne 14 ]; then
lt_yellow echo "SSO session expired, please sign-in to continue..."
aws sso login --profile woodmac-nonprod-L2 --no-cli-auto-prompt
else
dk_grey echo "SSO session still valid."
fi
}
