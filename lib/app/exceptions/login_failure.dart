class LoginFailure implements Exception {}

class LoginNotFoundFailure extends LoginFailure {
}

class LoginCredentialsEmpty extends LoginFailure {
}
