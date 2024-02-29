
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



InputDecoration InputFeildDecoration(context) {
  return InputDecoration(

      hintText:AppLocalizations.of(context)!.searchHint,
      prefixIcon: Icon(Icons.search),
      contentPadding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),

      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none
      )
  );
}
