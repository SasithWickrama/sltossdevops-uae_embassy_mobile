class GenaralResponse {
  final int result;
  var data;
  final String message;

  GenaralResponse({this.result=1, this.data = null, this.message = ''});

  factory GenaralResponse.fromJson(Map<String, dynamic> responsejson) {
    final result   = responsejson['result'] as int;
    final message = responsejson['message'] as String;
    final data    = responsejson['data'] ?? "";

    return GenaralResponse(result: result, message: message, data: data);
  }
}
