class BaseResponse<T> {
  BaseResponse({
    required this.data,
    required this.message,
  });

  T? data;
  String message;

  factory BaseResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) build) => BaseResponse(
    data: json['data'] != null ? build(json['data']) : null,
    message: json['message'],
  );

// Map<String, dynamic> toJson() => {
//   "data": data.toJson(),
//   "message": message,
// };
}