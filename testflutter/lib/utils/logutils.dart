bool _isDebug = true;
var _tag = "com.android.application";

/**
 * 打印d级别日志
 */
void d(var msg) {
  if (_isDebug) {
    print(_tag + "->${msg}");
  }
}
