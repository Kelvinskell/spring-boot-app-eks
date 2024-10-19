resource "aws_eks_addon" "cni" {
  cluster_name                = aws_eks_cluster.eks.name
  addon_name                  = "vpc-cni"
  addon_version               = "v1.18.5-eksbuild.1"
}