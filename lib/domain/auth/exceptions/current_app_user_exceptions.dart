import '../../../exceptions/app_exception.dart';

class CurrentAppUserException extends AppException {
  CurrentAppUserException() : super(title: 'アプリユーザー未認証です');
}
