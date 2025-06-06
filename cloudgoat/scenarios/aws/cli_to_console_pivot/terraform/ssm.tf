# SSM Configuration for cli_to_console_pivot scenario

# SSM Document for Session Manager customization
resource "aws_ssm_document" "session_manager_preferences" {
  name            = "cg-ssm-preferences-${var.cgid}"
  document_type   = "Session"
  document_format = "JSON"
  
  content = jsonencode({
    schemaVersion = "1.0"
    description   = "Document to customize Session Manager preferences"
    sessionType   = "Standard_Stream"
    inputs = {
      s3BucketName                = ""
      s3KeyPrefix                 = ""
      s3EncryptionEnabled         = true
      cloudWatchLogGroupName      = ""
      cloudWatchEncryptionEnabled = true
      idleSessionTimeout          = "20"
      shellProfile = {
        linux = "echo 'Welcome to the CloudGoat cli_to_console_pivot scenario!'\necho 'Try exploring the instance metadata service...'"
      }
    }
  })
} 