function ec2ips() {
  aws ec2 describe-instances --filters "Name=instance-id ,Values=*$1*" --query "Reservations[].Instances[].NetworkInterfaces[].[Association.PublicIp,PrivateIpAddress]"
}

function ec2id() {
  aws ec2 describe-instances --filters "Name=network-interface.addresses.private-ip-address,Values=$1" --query "Reservations[*].Instances[*].InstanceId" --output text
}

function ec2ssh() {
  arr=(`echo $3 | tr '@' ' '`)
  ssh $1 $2 ${arr[1]}@$(aws ec2 describe-instances --filter Name=instance-id,Values=${arr[2]} | jq '.Reservations[0].Instances[0].PrivateIpAddress' | tr -d '"')
}
