import 'package:ooolearning_app/exceptions/http_bad_request_exception.dart';

class HttpEntityNotFoundException extends HttpBadRequestException {
  const HttpEntityNotFoundException({required String? message})
      : super(message: message);
}
