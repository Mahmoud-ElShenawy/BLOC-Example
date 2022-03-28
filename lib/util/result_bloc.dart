

import 'package:flutter/foundation.dart';

@immutable
abstract class Result<T> {}

extension ResultExtensions<T> on Result<T> {
  R fold<R>(
      R Function(T value) onSuccess,
      R Function(Object error, String message) onFailure,
      ) {
    final self = this;
    if (self is Success<T>) {
      return onSuccess(self.value);
    }
    if (self is Failure) {
      return onFailure(self.error, self.message);
    }
    throw StateError('Cannot handle $this');
  }
}

class Success<T> implements Result<T> {
  final T value;

  Success(this.value);

  @override
  String toString() => 'Success{value: $value}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Success &&
              runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class Failure implements Result<Never> {
  final String message;
  final Object error;

  Failure({
    required this.message,
    required this.error,
  });

  @override
  String toString() => 'Failure{message: $message, error: $error}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Failure &&
              runtimeType == other.runtimeType &&
              message == other.message &&
              error == other.error;

  @override
  int get hashCode => message.hashCode ^ error.hashCode;
}
