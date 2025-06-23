# AWS Resource Lister 🛠️

A simple and interactive Bash script to list AWS resources across various services in a specific region.  
This tool helps DevOps engineers and cloud administrators quickly inventory their AWS assets from the CLI.

---

## 📌 Features

- ✅ Interactive prompt for AWS region selection
- ✅ Easy service selection via numbered options
- ✅ Supports 14 major AWS services + option to list **all**
- ✅ Clean and readable output
- ✅ Two versions available:
  - `aws_resource_list1.sh` – Your original version
  - `aws_resource_list.sh` – Modified version with AI enhancements

---
![Presentation1](https://github.com/user-attachments/assets/39410f81-016d-42db-b962-966f2ff6e4ed)
## 🖥️ Usage

```bash

#--Welcome to AWS Resource Lister--#

Enter AWS region (e.g., us-east-1): 
Then choose the service you'd like to list from the menu below:

python
Copy
Edit
1) ec2               4) cloudfront       7) route53         10) lambda          13) dynamodb  
2) rds               5) vpc              8) cloudwatch      11) sns             14) ebs  
3) s3                6) iam              9) cloudformation  12) sqs             15) all
Just enter the number corresponding to the service you want to list.

✅ Once selected, the script will list the resources for that service in the given region.

🔧 Requirements
AWS CLI must be installed and configured (aws configure)

IAM user or role should have read access to selected AWS services

📂 Files
aws_resource_list1.sh – Original version (manual scripting)

aws_resource_list.sh – Improved version using AI suggestions and refinements

🧠 Why This Script?
Managing cloud resources via console can be time-consuming. This CLI tool allows for:

Faster visibility into cloud inventory

Improved productivity for scripting and automation

Easy integration with cron jobs or monitoring scripts



📫 Contact
Built by Ashik Antony
Blog: ashikantony.hashnode.dev



![Presentation1](https://github.com/user-attachments/assets/39410f81-016d-42db-b962-966f2ff6e4ed)


  
