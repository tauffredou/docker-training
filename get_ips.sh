#!/bin/sh

CWD=$(cd $(dirname $0);pwd)

cat $CWD/terraform.tfstate | jq -r '.modules[].resources[] | select(.type == "aws_instance") | .primary.attributes | [.public_ip  , ."tags.Student" ] | join("\t")'  
#| map([ []."tags.Student", .public_ip])
