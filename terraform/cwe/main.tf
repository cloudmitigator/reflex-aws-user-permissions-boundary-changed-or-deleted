module "cwe" {
  source      = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe?ref=v2.0.1"
  name        = "UserPermissionsBoundaryChangedOrDeleted"
  description = "Rule for detecting the modification or deletion of IAM User permission boundary."

  event_pattern = <<PATTERN
{
  "source": [
    "aws.iam"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "iam.amazonaws.com"
    ],
    "eventName": [
      "PutUserPermissionsBoundary",
      "DeleteUserPermissionsBoundary"
    ]
  }
}
PATTERN

}
