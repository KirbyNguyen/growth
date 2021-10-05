/// [AuthStatus] enum constants
///
/// [successful] - authentication success, [emailAlreadyInUse] - an account with this email is already created,
/// [wrongPassword] - wrong password for the account, [weakPassword] - weak password for the account,
/// [invalidEmail] - email is invalid, [userNotFound] - no user associated with the combination of email and password,
/// [userDisabled] - user is disabled, [operationNotAllowed] - not allowed,
/// [tooManyRequests] - too many attempts, [undefined] - udefined.
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
