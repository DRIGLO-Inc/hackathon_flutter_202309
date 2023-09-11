import 'package:logger/logger.dart' as logger_lib;

final logger = Logger._getInstance;

class Logger {
  Logger._(this._logger, this._simpleLogger) {
    logger_lib.PrettyPrinter.defaultLevelEmojis
        .update(logger_lib.Level.info, (_) => '🟦 ');
    logger_lib.PrettyPrinter.defaultLevelEmojis
        .update(logger_lib.Level.debug, (_) => '🔧 ');
  }

  final logger_lib.Logger _logger;
  final logger_lib.Logger _simpleLogger;

  static Logger get _getInstance => _instance;
  static final _instance = Logger._(
    logger_lib.Logger(
      printer: logger_lib.PrettyPrinter(
        colors: false,
        stackTraceBeginIndex: 0,
        lineLength: 80,
      ),
    ),
    logger_lib.Logger(
      printer: _SimpleLogPrinter(),
    ),
  );

  void log(Object? message) {
    _simpleLogger.d(message, stackTrace: StackTrace.current);
  }

  void config(Object? message) {
    _logger.d(message);
  }

  void info(Object? message) {
    _logger.i(message);
  }

  void error(Object? message, [dynamic stackTrace]) {
    _logger.e(message, stackTrace: stackTrace);
  }

  void warn(Object? message) {
    _logger.w(message);
  }
}

class _SimpleLogPrinter extends logger_lib.LogPrinter {
  @override
  List<String> log(logger_lib.LogEvent event) {
    return ['[${_formatStackTrace(event.stackTrace)}]: ${event.message}'];
  }

  String _formatStackTrace(StackTrace? stackTrace) {
    final line = stackTrace?.toString().split('\n')[1] ?? '';

    // prefix `#1   ` を消す
    return line.replaceFirst(RegExp(r'#[0-9] +'), '');
  }
}
