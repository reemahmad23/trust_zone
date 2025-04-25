abstract class Failure {
  final String message;
  
  Failure(this.message);  // Constructor to accept the error message
}

class ServerFailure extends Failure {
  ServerFailure() : super('Server error occurred');  // Default message for server failure
}

class CacheFailure extends Failure {
  CacheFailure() : super('Cache error occurred');  // Default message for cache failure
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('Network error occurred');  // Default message for network failure
}
