
# Create IAM role for monitoring
resource "aws_iam_instance_profile" "node_app_profile" {
  name = "node_app_profile"
  role = aws_iam_role.node_app_role.name
}

resource "aws_iam_role" "node_app_role" {
  name = "node_app_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# RBAC - Role Based Access Control | Least Privilege
resource "aws_iam_role_policy" "node_app_role" {
  name = "node_app_role_policy"
  role = aws_iam_role.node_app_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ec2:*"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
          "s3:*"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
          "iam:PassRole",
          "iam:ListRoles",
          "iam:GetInstanceProfile",  # Added GetInstanceProfile permission
		  		"iam:CreateRole",
			  	"iam:DeleteRole",
			  	"iam:AttachRolePolicy",
			  	"iam:DetachRolePolicy",
			  	"iam:PutRolePolicy",
			  	"iam:ListAttachedRolePolicies",
			  	"iam:ListRolePolicies",
			  	"iam:ListRoleTags",
			  	"iam:GetRole",
		  		"iam:GetRolePolicy",
		  		"iam:PassRole",
		  		"iam:ListRoles",
		  		"iam:DeleteRolePolicy",
		  		"iam:CreateInstanceProfile",
		  		"iam:ListInstanceProfilesForRole",
		  		"iam:GetInstanceProfile",
		  		"iam:DeleteRole",
		  		"iam:DeleteInstanceProfile",
		  		"iam:AddRoleToInstanceProfile",
		  		"iam:RemoveRoleFromInstanceProfile",
		  		"iam:TagRole",
		  		"iam:GetPolicy",
		  		"iam:ListPolicies"          
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
  			"autoscaling:Describe*",
				"autoscaling:UpdateAutoScalingGroup",
				"autoscaling:CreateAutoScalingGroup",
				"autoscaling:DeleteAutoScalingGroup"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
            {
        Action = [

				"ssm:GetParameter",
				"ssm:GetParameters",
				"ssm:DescribeParameters",
				"ssm:PutParameter",
				"ssm:ListTagsForResource",
				"ssm:DeleteParameter"       
         ],
        Effect   = "Allow",
        Resource = "*"
      }      
    ]
  })
}