import 'dart:convert';

class PredictNerResponse {
  PredictNerResponse({
    this.result,
  });

  Result? result;

  factory PredictNerResponse.fromJson(Map<String, dynamic> json) =>
      PredictNerResponse(
        result: Result.fromJson(json["result"]),
      );
}

class Result {
  Result({
    this.status,
    this.data,
  });

  int? status;
  List<Data>? data;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        status: json["status"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );
}

class Data {
  Data({
    this.token,
    this.label,
  });

  String? token;
  String? label;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        label: json["label"],
      );
}
