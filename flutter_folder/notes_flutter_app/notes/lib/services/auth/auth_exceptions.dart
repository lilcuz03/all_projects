// Login exceptions 
class WrongPasswordAuthException implements Exception{}
class UserNotFoundAuthException implements Exception{}
class UserNotLogedInAuthException implements Exception{}

// Register exceptions
class WeakPasswordAuthException implements Exception{}
class InvalidEmailAuthException implements Exception{}
class EmailAlreadyInUseAuthException implements Exception{}

// Generic Exceptions
class GenericAuthException implements Exception{}


