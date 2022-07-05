# for each used
group = {
  "athena-group-1" = {
    enforce_workgroup_configuration = true,
    publish_cloudwatch_metrics_enabled = true,
    encryption_option = "SSE_S3"
  }
  "athena-group-2" = {
    enforce_workgroup_configuration = true,
    publish_cloudwatch_metrics_enabled = true,
    encryption_option = "SSE_S3"

  }
}

bucket = "athena-practices-suraj"


















#<----------------------> without for each
# bucket = "athena-practice-suraj"
# name = "athena-group"
# enforce_workgroup_configuration    = true
# publish_cloudwatch_metrics_enabled = true
# encryption_option = "SSE_S3"