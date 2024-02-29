import 'dart:core';
import 'dart:core';

import 'package:buy_tickets_list/model/hotel_details_model.dart';
import 'package:buy_tickets_list/widget/appBarWidget.dart';
import 'package:buy_tickets_list/widget/elevated_button_widget.dart';
import 'package:buy_tickets_list/screens/home/widgets/hotel_list_item_en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HotelDetailsScreen extends StatefulWidget {
final HotelDetail hotel;


  const HotelDetailsScreen(this.hotel
  );

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          HotelListItemEn(hotel: widget.hotel),

          const Spacer(),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButtonWidget(
                text: AppLocalizations.of(context)!.bookingButtonText,
                backgroundColor: Colors.red,
                onTap: () {},
                textColor: Colors.white,
              ))

        ],
      ),
    );
  }


}

