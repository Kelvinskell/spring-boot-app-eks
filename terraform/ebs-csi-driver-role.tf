data "aws_iam_policy_document" "aws_csi" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}

resource "aws_iam_role" "aws_csi" {
  name               = "${aws_eks_cluster.eks.name}-aws-csi-role-${local.env}"
  assume_role_policy = data.aws_iam_policy_document.aws_csi.json
  tags = {
    Name = "${local.app}-aws_csi_policy-${local.env}"
    env = local.env
    app = local.app
  }
}

resource "aws_iam_role_policy_attachment" "aws_csi" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.aws_csi.name
}

resource "aws_eks_pod_identity_association" "aws_csi" {
  cluster_name    = aws_eks_cluster.eks.name
  namespace       = "kube-system"
  service_account = "ebs-csi-controller-sa"
  role_arn        = aws_iam_role.aws_csi.arn
}