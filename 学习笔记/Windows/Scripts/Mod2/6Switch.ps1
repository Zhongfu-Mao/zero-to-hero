# Switch can be easier to maintain than If statement
#and can provide additional features

$status = 1

$status_text = Switch ($status) {
  0 { 'ok' }
  1 { 'error' }
  2 { 'jammed' }
  3 { 'overheated' }
  4 { 'empty' }
  default { 'unknown' }
}

$status_text
