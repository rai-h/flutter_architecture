class HttpResponse<T> {
  int statuscode;
  String message;
  T data;

  HttpResponse(
      {required this.statuscode, required this.data, required this.message});

  factory HttpResponse.fromJson(Map<String, dynamic> json) {
    return HttpResponse(
        statuscode: json['code'], data: json['data'], message: json['message']);
  }
}
