# Create IAM groups
resource "aws_iam_group" "iam_devops_groups" {
  count = length(var.iam_devops_admin_group)
  name = var.iam_devops_admin_group[count.index]
}


# Add existing IAM users to IAM groups
resource "aws_iam_user_group_membership" "iam_group_names" {
  count = length(var.existing_iam_user_names)
  user  = var.existing_iam_user_names[count.index]
  groups = [aws_iam_group.iam_devops_groups[0].name]  # Replace [0] with the index of the desired group
}

#### Attach the AdministratorAccess managed policy to the IAM group
resource "aws_iam_group_policy_attachment" "devops_admin_group_attachment" {
  count = length(var.iam_devops_admin_group)  
  group      = aws_iam_group.iam_devops_groups[count.index].name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess" 
}

resource "aws_iam_group_policy_attachment" "devops_admin_billing_group_attachment" {
  count = length(var.iam_devops_admin_group)  
  group      = aws_iam_group.iam_devops_groups[count.index].name
  policy_arn =  "arn:aws:iam::aws:policy/job-function/Billing"
}