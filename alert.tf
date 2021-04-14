resource "checkly_alert_channel" "ac1" {
  email {
    address = "john@example.com"
  }
  send_recovery = true 
  send_failure = false
  send_degraded = true 
  ssl_expiry = true 
  ssl_expiry_threshold = 22
}
