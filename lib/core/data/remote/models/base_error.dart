class BaseError {
  String code;
  String message;
  String shortMessage;

  BaseError(this.code, this.message, this.shortMessage);

  BaseError.http()
      : code = '',
        message = '',
        shortMessage = '';

  BaseError.network()
      : code = '',
        message = '',
        shortMessage = '';

  BaseError.unexpected()
      : code = '',
        message = '',
        shortMessage = '';

  BaseError.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'],
        shortMessage = json['shortMessage'];

  @override
  String toString() {
    return 'BaseError{code: $code, message: $message, shortMessage: $shortMessage}';
  }

}