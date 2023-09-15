import '../../exceptions/current_app_user_exceptions.dart';

sealed class CurrentAppUser {
  const CurrentAppUser();

  factory CurrentAppUser.authenticated({required String userId}) {
    return CurrentAppUserAuthenticated(userId: userId);
  }

  factory CurrentAppUser.none() {
    return const CurrentAppUserNone();
  }

  factory CurrentAppUser.loading() {
    return const CurrentAppUserLoading();
  }

  /// null チェックをしたい場合は、`getUserIdOrNull()` を使用する
  ///
  /// userId が null だった場合、エラーは `CurrentAppUserException` を throw する
  String getUserId();

  /// null チェックをスキップしたい場合は、`getUserId()` を使用する
  String? getUserIdOrNull();

  bool get isAuthenticated;
}

class CurrentAppUserAuthenticated implements CurrentAppUser {
  const CurrentAppUserAuthenticated({required String userId})
      : _userId = userId;

  final String _userId;

  @override
  String getUserId() {
    return _userId;
  }

  @override
  String? getUserIdOrNull() {
    return _userId;
  }

  @override
  bool get isAuthenticated => true;
}

class CurrentAppUserNone implements CurrentAppUser {
  const CurrentAppUserNone();

  @override
  String? getUserIdOrNull() {
    return null;
  }

  @override
  String getUserId() {
    throw CurrentAppUserException();
  }
  @override
  bool get isAuthenticated => false;
}

class CurrentAppUserLoading implements CurrentAppUser {
  const CurrentAppUserLoading();

  @override
  String? getUserIdOrNull() {
    return null;
  }

  @override
  String getUserId() {
    throw CurrentAppUserException();
  }
  @override
  bool get isAuthenticated => false;
}
