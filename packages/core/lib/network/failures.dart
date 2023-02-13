
abstract class Failure{}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class ConnectionFailure extends Failure {}

class RequestFailure extends Failure {
  final String message;

  RequestFailure({required this.message});
}
