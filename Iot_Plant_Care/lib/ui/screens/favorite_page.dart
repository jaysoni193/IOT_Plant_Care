import 'package:Iot_Plant_Care/constants.dart';
import 'package:Iot_Plant_Care/models/plants.dart';
import 'package:Iot_Plant_Care/ui/widgets/plant_widgets.dart';
import 'package:flutter/material.dart';


class FavoritePage extends StatefulWidget {
  final List<Plant> favoritePlants;

  const FavoritePage({Key? key, required this.favoritePlants})
      : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}
class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.favoritePlants.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset(
                        'assets/images/fav.png',
                        color: Constants.primaryColor,
                      ), // Fix This Later
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your favorited Plants',
                      style: TextStyle(
                        color: Constants.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
                height: size.height * .9,
                child: ListView.builder(
                    itemCount: widget.favoritePlants.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return PlantWidget(
                        index: index,
                        plantList: widget.favoritePlants,
                      );
                    }),
              ));
  }
}
