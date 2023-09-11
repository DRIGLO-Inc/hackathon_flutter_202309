/// ダイアログルートに設定する RouteSettings の name の固定値。
///
/// NavigationObserver で、ダイアログのイベントをスキップしたい時などに活用。
///
/// ```dart
/// class RequestDialog extends StatelessWidget {
///   const RequestDialog._();
///
///   static Future<void> show(
///     BuildContext context, {
///     bool barrierDismissible = true,
///   }) {
///     return showDialog<void>(
///       routeSettings: RouteSettings(
///         /** ここに追加 */
///         name: kDialogRouteName,
///       ),
///     );
///   }
/// ```
const kDialogRouteName = '/dialog';
