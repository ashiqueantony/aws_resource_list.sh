#!/bin/bash

# Colors
GREEN="\e[32m"
NC="\e[0m" # No Color

echo -e "${GREEN}Welcome to AWS Resource Lister${NC}"
read -p "Enter AWS region (e.g., us-east-1): " aws_region

while true; do
  echo -e "${GREEN}
1) ec2               4) cloudfront       7) route53         10) lambda          13) dynamodb
2) rds               5) vpc              8) cloudwatch      11) sns             14) ebs
3) s3                6) iam              9) cloudformation  12) sqs             15) all
${NC}"
  read -p "Select the AWS service you want to list (or type 0 to exit): " choice

  if [[ "$choice" == "0" ]]; then
    echo "Exiting. Thank you!"
    break
  fi

  case $choice in
    1 | ec2)
      echo -e "\n${GREEN}Listing EC2 Instances in $aws_region...${NC}"
      aws ec2 describe-instances --region "$aws_region"
      echo -e "\n${GREEN}--------- EC2 Summary ---------${NC}"
      aws ec2 describe-instances --region "$aws_region" \
        --query "Reservations[*].Instances[*].{ID:InstanceId, Name:Tags[?Key=='Name']|[0].Value, State:State.Name}" \
        --output table
      ;;
    2 | rds)
      echo -e "\n${GREEN}Listing RDS Instances in $aws_region...${NC}"
      aws rds describe-db-instances --region "$aws_region"
      ;;
    3 | s3)
      echo -e "\n${GREEN}Listing S3 Buckets...${NC}"
      aws s3api list-buckets
      echo -e "\n${GREEN}-------- S3 Summary ---------${NC}"
      aws s3api list-buckets --query "Buckets[*].{Name:Name, CreationDate:CreationDate}" --output table
      ;;
    4 | cloudfront)
      echo -e "\n${GREEN}Listing CloudFront Distributions...${NC}"
      aws cloudfront list-distributions
      ;;
    5 | vpc)
      echo -e "\n${GREEN}Listing VPCs in $aws_region...${NC}"
      aws ec2 describe-vpcs --region "$aws_region"
      ;;
    6 | iam)
      echo -e "\n${GREEN}Listing IAM Users...${NC}"
      aws iam list-users
      echo -e "\n${GREEN}-------- IAM Summary ---------${NC}"
      aws iam list-users --query "Users[*].{UserName:UserName, CreateDate:CreateDate}" --output table
      ;;
    7 | route53)
      echo -e "\n${GREEN}Listing Route53 Hosted Zones...${NC}"
      aws route53 list-hosted-zones
      ;;
    8 | cloudwatch)
      echo -e "\n${GREEN}Listing CloudWatch Alarms in $aws_region...${NC}"
      aws cloudwatch describe-alarms --region "$aws_region"
      ;;
    9 | cloudformation)
      echo -e "\n${GREEN}Listing CloudFormation Stacks in $aws_region...${NC}"
      aws cloudformation describe-stacks --region "$aws_region"
      ;;
    10 | lambda)
      echo -e "\n${GREEN}Listing Lambda Functions in $aws_region...${NC}"
      aws lambda list-functions --region "$aws_region"
      echo -e "\n${GREEN}-------- Lambda Summary ---------${NC}"
      aws lambda list-functions --region "$aws_region" \
        --query "Functions[*].{FunctionName:FunctionName, Runtime:Runtime}" \
        --output table
      ;;
    11 | sns)
      echo -e "\n${GREEN}Listing SNS Topics in $aws_region...${NC}"
      aws sns list-topics --region "$aws_region"
      ;;
    12 | sqs)
      echo -e "\n${GREEN}Listing SQS Queues in $aws_region...${NC}"
      aws sqs list-queues --region "$aws_region"
      ;;
    13 | dynamodb)
      echo -e "\n${GREEN}Listing DynamoDB Tables in $aws_region...${NC}"
      aws dynamodb list-tables --region "$aws_region"
      ;;
    14 | ebs)
      echo -e "\n${GREEN}Listing EBS Volumes in $aws_region...${NC}"
      aws ec2 describe-volumes --region "$aws_region"
      echo -e "\n${GREEN}-------- EBS Summary ---------${NC}"
      aws ec2 describe-volumes --region "$aws_region" \
        --query "Volumes[*].{ID:VolumeId, State:State, Size:Size}" \
        --output table
      ;;
    15 | all)
      echo -e "${GREEN}Listing all supported services...${NC}"
      # Could loop all cases if needed
      ;;
    *)
      echo -e "${RED}Invalid choice. Try again.${NC}"
      ;;
  esac
done
