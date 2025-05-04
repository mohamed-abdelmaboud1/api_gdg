class Failure implements Exception {
  final String message;
  Failure(this.message);

  @override
  String toString() => 'Failure: $message';
}

// class Failure {
//   final String message;
//   final bool shownBySnackBar;
//   final int? statusCode;
//   Failure({
//     required this.message,
//     this.shownBySnackBar = false,
//     this.statusCode,
//   });
// }

// //firebase failure
// class FirebaseFailure extends Failure {
//   FirebaseFailure({required super.message});
// }

// class ServerFailure extends Failure {
//   ServerFailure({
//     required super.message,
//     super.shownBySnackBar,
//     super.statusCode,
//   });

//   factory ServerFailure.fromDioException(DioException dioException) {
//     switch (dioException.type) {
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure(message: 'انتهت مهلة الاتصال');
//       case DioExceptionType.sendTimeout:
//         return ServerFailure(message: 'انتهت مهلة الإرسال');
//       case DioExceptionType.receiveTimeout:
//         return ServerFailure(message: 'انتهت مهلة الاستقبال');
//       case DioExceptionType.badCertificate:
//         return ServerFailure(message: 'شهادة سيئة');
//       case DioExceptionType.badResponse:
//         return ServerFailure.fromDioResponse(
//             dioException.response!.statusCode!, dioException.response!.data);
//       case DioExceptionType.cancel:
//         return ServerFailure(
//             message: 'حدث خطأ في الخادم ، يرجى المحاولة مرة أخرى');
//       case DioExceptionType.connectionError:
//         return ServerFailure(message: 'لا يوجد اتصال بالإنترنت');
//       case DioExceptionType.unknown:
//         if (dioException.message!.contains('SocketException')) {
//           return ServerFailure(message: 'لا يوجد اتصال بالإنترنت');
//         }
//         return ServerFailure(message: 'خطأ غير معروف، يرجى المحاولة مرة أخرى');
//     }
//   }

//   factory ServerFailure.fromDioResponse(int statusCode, dynamic response) {
//     if (statusCode >= 300 && statusCode < 400) {
//       return ServerFailure(
//           message: 'إعادة توجيه: يجب اتخاذ إجراء إضافي لإكمال الطلب');
//     } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
//       if (response['error']['errors'] != null) {
//         return ServerFailure(
//           message: response['error']['errors'][0]['message'],
//           statusCode: statusCode,
//         );
//       }
//       return ServerFailure(
//         message: response['message'],
//       );
//     } else if (statusCode == 404) {
//       if (response['error']['errors'] != null) {
//         return ServerFailure(
//           message: response['error']['errors'][0]['message'],
//         );
//       }
//       return ServerFailure(
//         message: response['message'],
//       );
//     } else if (statusCode >= 500 && statusCode < 600) {
//       return ServerFailure(
//           message: 'حدث خطأ في الخادم ، يرجى المحاولة مرة أخرى');
//     } else {
//       if (response['error']['errors'] != null) {
//         return ServerFailure(
//           message: response['error']['errors'][0]['message'],
//         );
//       }
//       return ServerFailure(
//         message: response['message'],
//       );
//     }
//   }
// }
