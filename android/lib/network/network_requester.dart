//all data calling

import 'dart:convert';

import 'package:flutter/services.dart';

class NetworkRequester{
  List item=[];
  Future getData() async {
    final response=await rootBundle.loadString("assets/hotel_details.json");

    final data=await jsonDecode(response);
    return data;
    // print(item=data["HotelDetails"]);

  }
}