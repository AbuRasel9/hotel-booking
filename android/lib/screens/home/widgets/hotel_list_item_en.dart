import 'package:buy_tickets_list/language_change/controller/language_change_controller.dart';
import 'package:buy_tickets_list/model/hotel_details_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HotelListItemEn extends StatelessWidget {

  final HotelDetail hotel;

  const HotelListItemEn({
    super.key,
    required this.hotel,
  });


  @override
  Widget build(BuildContext context) {



    return Card(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Hotel Image
          CachedNetworkImage(
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
            imageUrl:hotel.hotelImage,

              height: MediaQuery.of(context).size.height / 2.6,
                width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,

          ),
          const SizedBox(
            height: 10,
          ),
          // SizedBox(width: 5,),
          //hotel name and rating of hotel
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(hotel.hotelName.toString()
                      ,
                      style: const TextStyle(
                          color: Colors.red, fontSize: 17, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    //hotel rating bar package
                    RatingBarIndicator(
                      rating: hotel.hotelRatingStar,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      itemCount: 5,
                      itemSize: 25.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                //hotel address
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 18,
                    ),
                    Text(
                      hotel.hotelAddress,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                // price section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      AppLocalizations.of(context)!.refoundPrice,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      "${hotel.price}",
                      style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
