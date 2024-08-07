1. IAM - Users, Groups, Permissions - DONE
2. Network - VPC, Subnets, IP, SG, NACL, MFA - DONE
3. Presentation layer - ALB, Nginx - Redirected to Application layer - Pubclic - DONE
4. Application - EC2 (ASG, Launch Templates, Snapshot, Key-pair, SG,) - Private
5. Database layer - PostgresQL - RDS (Instance, SG) - Private
6. Backup - DB, S3 bucket - MFA
7. CDN - CloudFront - Provide Low Latency
8. TFStatefiles - S3 bucket, Terraform Cloud.
9. Security - WAF, AWS Shield, Guard, 
10. CloudWatch - Optional
11. Logging - ELK Stack - Optional