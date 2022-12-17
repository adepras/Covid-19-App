import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'exceptions.dart';
import 'package:flutter/material.dart';

class ApiClient {
  getNewsResponse(String value) async {
    String endpoint = _getNewsEndpoint(value);
    String url =
        "https://newsapi.org/v2/everything?q=covid&apiKey=1522aa0b95594c1b9366e678be800587" +
            endpoint;
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      if (json['status'] == "ok") {
        return json;
      } else if (json['status'] == "error") {
        throw FetchDataException(json['code'] + json['message']);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  _getNewsEndpoint(String value) {
    if (value == "Popular") {
      return "&sortBy=popular";
    } else if (value == "Last Week") {
      return "&from=${_getDate(7)}&sortBy=popular";
    } else if (value == "Last 15") {
      return "&from=${_getDate(15)}&sortBy=popular";
    } else if (value == "Last Month") {
      return "&from=${_getDate(30)}&sortBy=popular";
    }
    return "";
  }

  _getDate(int days) {
    var now = DateTime.now();
    now = now.subtract(Duration(days: days));
    var date = now.toString();
    date = date.split(" ")[0];
    return date;
  }
}
