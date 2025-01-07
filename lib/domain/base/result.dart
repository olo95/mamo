sealed class Result<T, Y> {}

class Success<T, Y> extends Result<T, Y> {
  final T value;

  Success(this.value);
}

class Failure<T, Y> extends Result<T, Y> {
  final Y error;

  Failure(this.error);
}