class BaseResponseList<T> {
  BaseResponseList({
    required this.data,
    required this.message,
  });

  List<T>? data;
  String message;

  factory BaseResponseList.fromJson(Map<String, dynamic> json, Function(List<dynamic>) build) => BaseResponseList(
    data: json['data'] != null ? build(json['data']) : null,
    message: json['message'],
  );

// Map<String, dynamic> toJson() => {
//   "data": data.toJson(),
//   "message": message,
// };
}
