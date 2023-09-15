import '../../../exceptions/app_exceptions.dart';

class CurrentAppUserException extends AppException {
  CurrentAppUserException() : super(title: 'アプリユーザー未認証です');
}
