import 'package:starwars/core/data/remote/error_utils.dart';
import 'package:starwars/core/data/remote/models/base_error.dart';

class BaseResponse {
  BaseError _error;

  void withError(BaseError error) {
    _error = error;
  }

  bool hasError() => _error != null ? true : false;
  String getErrorMessage() {
    if (this.hasError()) {
      return ErrorUtil().getError(_error.code);
    }
    return null;
  }
}
