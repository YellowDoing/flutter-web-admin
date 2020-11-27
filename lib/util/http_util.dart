import 'dart:convert';
import 'dart:ui';
import 'package:admin_flutter_web/data/auth_data.dart';
import 'package:admin_flutter_web/generated/json/base/json_convert_content.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

typedef SuccessCallback<T> = void Function(T data, String message);

typedef ErrorCallback = void Function(int code, String message);

const String _host = "http://192.168.1.217:8080";

final Utf8Decoder _utf8decoder = new Utf8Decoder();

class HttpUtil<T> {
  final ErrorCallback errorCallback;

  final VoidCallback completeCallback;

  final SuccessCallback<T> success;

  HttpUtil.post(String url,
      {this.completeCallback,
      this.errorCallback,
      body,
      Map<String, String> headers,
      this.success,
      bool isJson = false,
      bool key = true}) {
    if (headers == null) {
      headers = {};
    }

    if (isJson) {
      headers['Content-Type'] = 'application/json';
    }

    if (key) {
      headers['key'] = authData.userEntity.key;
    }


    http.post(_host + url, body: body, headers: headers).then((response) {
      debugPrint(url);

      var result = json.decode(_utf8decoder.convert(response.bodyBytes));
      debugPrint(result.toString());

      if (response.statusCode == 200) {
        int code = result["code"];
        String message = result["message"];
        if (code == 200) {
          var data = result['data'];
          if (T is Type) {
            success?.call(JsonConvert.fromJsonAsT<T>(data), message);
          } else {
            success?.call(data, message);
          }
        } else {
          errorCallback?.call(code, message);
        }
      } else {
        errorCallback?.call(response.statusCode, response.toString());
      }

      completeCallback?.call();
    });
  }
}
