class ResponModel {
  final String status;
  final String message;
  final dynamic data;

  ResponModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResponModel.fromJson(Map<String, dynamic> json) {
    return ResponModel(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }
}
