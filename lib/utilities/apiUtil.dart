import 'dart:io';
import 'package:dio/dio.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/models/httpException.dart';

class APIUtil {
  static String apiToken =
      'xTfbbYA8USxK2rTQLzjnyECNZTvJT5sgNGN4CLUMPH6rPVGtsnPBuwdCjkVYQFyAmpxyCCw3XYvj976Rrn7PwfUsHnk7SH3LG3NJsLgbS2mdYjJpNTeCWvge9BcDxEXwcUT6u9QMWCYptfHUZh8x8GV3Eetmcjqj7mvMBfkEzwGDkV3bfwMb3NB9jPUXReNUvejQRzREpFKznA5D7xG5UDpahKukjs8jGvk8BLw2WCRTSkVSRMSJZ8zJt4ZxmjkY';

  static String get platform => Platform.isIOS ? "ios" : "android";

  static Future request<T>({
    Future<Response<T>> future,
  }) async {
    try {
      Response<T> response = await future;
      checkResponse(response);
      return response.data;
    } on SocketException catch (e) {
      throw HttpException(message: S.current.socketException);
    } on HttpException catch (e) {
      throw HttpException(message: S.current.httpException);
    } on FormatException catch (e) {
      throw HttpException(message: S.current.formatException);
    } catch (e) {
      print('Error : ' + e.toString());
      String errorMessage = S.current.formatException;
      if (e.toString().contains('500')) {
        errorMessage = S.current.httpException;
      } else if (e.toString().toLowerCase().contains('socket') ||
          e.toString().toLowerCase().contains('timed out') ||
          e.toString().contains('CONNECT_TIMEOUT')) {
        errorMessage = S.current.socketException;
      } else if (e.toString().contains('400')) {
        errorMessage = S.current.formatException;
      } else {
        print('Unhandled error : ' + e.toString());
        errorMessage = e.toString();
      }
      throw HttpException(message: errorMessage);
    }
  }

  static checkResponse(Response response) {
    print('Checking response...');
    print('Response : ' + response.data.toString());
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      if (response.data.toString().contains('success=false')) {
        final errorMessage =
            response.data.toString().split(',')[0].split('message=')[1];
        throw errorMessage;
      } else {
        print('Good Response.');
      }
    } else {
      print('Bad Response.');
    }
  }
}
