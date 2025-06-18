import 'package:supabase/supabase.dart';

class ServerException implements Exception{

  final String errorMsg;
  final String? statusCode;

  ServerException({
    required this.errorMsg,
     this.statusCode
});

  @override
  String toString() {
    return errorMsg;
  }


  Exception handleException(AuthException exception) {
    final msg = exception.message.toLowerCase();

    if (msg.contains('invalid login credentials')) {
      return ServerException(statusCode: "401", errorMsg: 'Invalid email or password.');
    } else if (msg.contains('email already registered') || msg.contains('user already registered')) {
      return ServerException(statusCode: "409", errorMsg: 'Email is already in use.');
    } else if (msg.contains('email not confirmed')) {
      return ServerException(statusCode: "403", errorMsg: 'Email not confirmed. Check your inbox.');
    } else if (msg.contains('password should be at least')) {
      return ServerException(statusCode: "400", errorMsg: 'Password is too weak.');
    } else if (msg.contains('rate limit')) {
      return ServerException(statusCode: "429", errorMsg: 'Too many requests. Please try again later.');
    }

    return ServerException(statusCode: "500", errorMsg: 'Unexpected error occurred. Please try again.');

  }

}