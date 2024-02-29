import 'package:buy_tickets_list/screens/home/widgets/hotel_list_item_bn.dart';
import 'package:buy_tickets_list/language_change/controller/language_change_controller.dart';
import 'package:buy_tickets_list/model/hotel_details_model.dart';
import 'package:buy_tickets_list/network/network_requester.dart';
import 'package:buy_tickets_list/screens/hotel_details_screen.dart';
import 'package:buy_tickets_list/screens/home/widgets/hotel_list_item_en.dart';
import 'package:buy_tickets_list/widget/appBarWidget.dart';
import 'package:buy_tickets_list/widget/elevated_button_widget.dart';
import 'package:buy_tickets_list/widget/input_feild_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

enum language { english, bangla }

class _HomeViewState extends State<HomeView> {
  //for bangla translate decleare variable
  String ra = 'en';

  bool isLoading = false;
  HotelDetailsModel? _hotelDetailsModel;

  final searchBarController = TextEditingController();

  //call data
  Future _getAllHotelInformation() async {
    isLoading = true;
    final response = await NetworkRequester().getData();
    isLoading = false;
    _hotelDetailsModel = HotelDetailsModel.fromJson(response);
    setState(() {});
    print(_hotelDetailsModel?.hotelDetails);
  }

  @override
  void initState() {
    _getAllHotelInformation();
    super.initState();
  }

  //search function
  List<HotelDetail> searchList() {
    if (searchBarController.text.isEmpty) {
      return _hotelDetailsModel?.hotelDetails ?? [];
    }
    return _hotelDetailsModel!.hotelDetails
        .where((element) =>
            element.hotelName
                .toLowerCase()
                .startsWith(searchBarController.text.toLowerCase()) ||
            element.hotelAddress
                .toLowerCase()
                .startsWith(searchBarController.text.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final list = searchList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: 130,
        title: Padding(
          padding:
              const EdgeInsets.only(top: 30.0, left: 0, right: 0, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.areaAllHotel,
                    maxLines: 2,
                    style: TextStyle(color: Colors.white),
                  ),
                  Consumer<LanguageChangeController>(
                      builder: (context, provider, child) {
                    return PopupMenuButton(
                        iconColor: Colors.white,
                        onSelected: (language item) {
                          if (language.english.name == item.name) {
                            ra = "en";
                            provider.changeLanguage(Locale("en"));

                          } else {
                            ra="bn";
                            provider.changeLanguage(Locale("bn"));



                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<language>>[
                              PopupMenuItem(
                                  value: language.english,
                                  child: Text("English")),
                              PopupMenuItem(
                                  value: language.bangla,
                                  child: Text("Bangla")),
                            ]);
                  })
                ],
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

              //form feild widget
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchBarController,
                decoration: InputFeildDecoration(context),
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : list.isEmpty
              ?  Center(
                  child: Text(
                  AppLocalizations.of(context)!.searchDataStatus,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    (context, listen: false);
                    return InkWell(
                        onTap: () async {
                          print("ttttttttttttttttt$ra");

                          //keybord hi
                          FocusScope.of(context).unfocus();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ra == "bn"
                                      ? HotelListItemBn(
                                          hotel: list[index],
                                          //pass Elevated button 
                                          button: ElevatedButtonWidget(
                                            text: AppLocalizations.of(context)!
                                                .bookingButtonText,
                                            backgroundColor: Colors.red,
                                            onTap: () {},
                                            textColor: Colors.white,
                                          ),
                                          appBar:buildAppBar(context) ,
                                        )
                                      : HotelDetailsScreen(list[index])));
                        },
                        child: ra == "bn"
                            ? HotelListItemBn(hotel: list[index])
                            : HotelListItemEn(
                                hotel: list[index],
                              ));
                  }),
    );
  }
}
