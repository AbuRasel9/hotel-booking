// To parse this JSON data, do
//
//     final hotelDetailsModel = hotelDetailsModelFromJson(jsonString);

import 'dart:convert';

HotelDetailsModel hotelDetailsModelFromJson(String str) => HotelDetailsModel.fromJson(json.decode(str));

String hotelDetailsModelToJson(HotelDetailsModel data) => json.encode(data.toJson());

class HotelDetailsModel {
  String countryAddress;
  List<HotelDetail> hotelDetails;

  HotelDetailsModel({
    required this.countryAddress,
    required this.hotelDetails,
  });

  factory HotelDetailsModel.fromJson(Map<String, dynamic> json) => HotelDetailsModel(
    countryAddress: json["CountryAddress"],
    hotelDetails: List<HotelDetail>.from(json["HotelDetails"].map((x) => HotelDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CountryAddress": countryAddress,
    "HotelDetails": List<dynamic>.from(hotelDetails.map((x) => x.toJson())),
  };
}

class HotelDetail {
  int id;
  String hotelName;
  String? hotelNameBn;
  String hotelImage;
  String hotelAddress;
  String? hotelAddressBn;
  double hotelRatingStar;
  int price;
  String? priceBn;
  String? hotelNamen;

  HotelDetail({
    required this.id,
    required this.hotelName,
    this.hotelNameBn,
    required this.hotelImage,
    required this.hotelAddress,
    this.hotelAddressBn,
    required this.hotelRatingStar,
    required this.price,
    this.priceBn,
    this.hotelNamen,
  });

  factory HotelDetail.fromJson(Map<String, dynamic> json) => HotelDetail(
    id: json["ID"],
    hotelName: json["HotelName"],
    hotelNameBn: json["HotelNameBn"],
    hotelImage: json["HotelImage"],
    hotelAddress: json["HotelAddress"],
    hotelAddressBn: json["HotelAddressBn"],
    hotelRatingStar: json["HotelRatingStar"]?.toDouble(),
    price: json["Price"],
    priceBn: json["priceBn"],
    hotelNamen: json["HotelNamen"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "HotelName": hotelName,
    "HotelNameBn": hotelNameBn,
    "HotelImage": hotelImage,
    "HotelAddress": hotelAddress,
    "HotelAddressBn": hotelAddressBn,
    "HotelRatingStar": hotelRatingStar,
    "Price": price,
    "priceBn": priceBn,
    "HotelNamen": hotelNamen,
  };
}
