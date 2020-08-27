import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:admin_flutter_web/generated/json/base/json_convert_content.dart';

typedef SuccessCallback<T> = void Function(T data, String message);

typedef ErrorCallback = void Function(int code, String message);

class HttpUtil<T> {

  final String url;

  final ErrorCallback errorCallback;

  final VoidCallback completeCallback;

  final body;

  Map<String, String> headers = {};

  final SuccessCallback<T> success;

  final BuildContext context;

  HttpUtil.post(
      {this.url,
      this.completeCallback,
      this.errorCallback,
      this.body = const {},
      this.headers,
      this.success,
      this.context,

      }) {

    http.post(url, body: body, headers: headers).then((response) {
      var result = json.decode(response.body);
      debugPrint(result.toString());
      if (response.statusCode == 200) {
        int code = result["code"];
        String message = result["message"];
        if (code == 200) {
          var data = result['data'];
          if (T is Type) {
            debugPrint('JsonConvert');
            success?.call(JsonConvert.fromJsonAsT<T>(data), message);
          } else {
            debugPrint('else');
            success?.call(data, message);
          }
        } else {}
      } else {}
    });
  }



  void _showMessage(String message){
    if(context != null){
      showGeneralDialog(context: context, pageBuilder:(_,__,___){
        return SimpleDialog(

        );
      });
    }
  }
}
