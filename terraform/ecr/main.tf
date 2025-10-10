provider "aws" {
  region = var.aws_region
}

resource "aws_ecr_repository" "app" {
  name                 = var.ecr_name
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Project = "boardgame-app"
    Env     = var.env
  }
}

# IAM policy for EC2 instances to pull from ECR + read objects from S3 (optional)
data "aws_iam_policy_document" "ec2_ecr_pull" {
  statement {
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage"
    ]
    resources = ["*"]
  }
  # if images are stored in S3, add s3:GetObject etc.
}

resource "aws_iam_policy" "ec2_ecr_pull" {
  name   = "${var.project}-ec2-ecr-pull"
  policy = data.aws_iam_policy_document.ec2_ecr_pull.json
}


