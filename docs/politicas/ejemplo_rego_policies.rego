package authz

default allow = false

allow {
  input.user == "admin"
  input.method == "GET"
  input.path == "/datos_confidenciales"
}

