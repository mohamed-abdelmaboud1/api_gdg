abstract class ApiConsumer {
  get(
    path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,
  });
  post(
    path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,

  });
  put(
    path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,

  });
  delete(
    path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,
  });
}
