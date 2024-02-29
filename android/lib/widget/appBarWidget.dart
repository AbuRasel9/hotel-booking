import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.red,
    toolbarHeight: 110,
    title:  Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 5, right: 5, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 30,),

          Text(
            AppLocalizations.of(context)!.areaAllHotel,
            maxLines: 2,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "01 Sep,24,-02 Sep 24| 1 Night|1 Room,1 Adult",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(
            height: 5,
          ),

          // SizedBox(height:,)
        ],
      ),
    ),
  );
}