/// [AuthStatus] enum constants are used in [AuthenticationService]
enum AuthStatus {
  successful,
  emailAlreadyInUse,
  wrongPassword,
  weakPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
}
