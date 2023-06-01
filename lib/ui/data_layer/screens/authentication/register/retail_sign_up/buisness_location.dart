import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/screens/main_pages/homepage.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';


/// Cette classe gère le contrôleur de carte mapController qui permet de contrôler la carte OpenStreetMap. 
/// Dans la méthode initState(), le contrôleur 
/// est initialisé avec la position de l'utilisateur et une areaLimit définie comme la zone mondiale.
/// 
// ignore: todo
/// TODO il faudra ajouté le clique sur la carte pour sélectionner directement une position X 

class BuisnessLocation extends StatefulWidget {
  const BuisnessLocation({super.key});

  @override
  State<BuisnessLocation> createState() => _BuisnessLocationState();
}

class _BuisnessLocationState extends State<BuisnessLocation> {
  late MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController.withUserPosition(
      areaLimit: const BoundingBox.world(),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await mapController.advancedPositionPicker();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.appThemeColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: const [
          Icon(Icons.search, color: Colors.white),
        ],
        elevation: 0.0,
        title: const Text(
          "Add Business Location",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: OSMFlutter(
                      controller: mapController,
                      trackMyPosition: true,
                      initZoom: 19,
                      stepZoom: 1,
                      staticPoints: [
                        StaticPositionGeoPoint(
                            '1',
                            const MarkerIcon(
                              icon: Icon(Icons.person),
                            ),
                            [
                              GeoPoint(
                                  latitude: 67.111222, longitude: 37.415263)
                            ])
                      ],
                      roadConfiguration: const RoadOption(
                        roadColor: Colors.yellowAccent,
                      ),
                      markerOption: MarkerOption(
                          defaultMarker: const MarkerIcon(
                        icon: Icon(
                          Icons.person_pin_circle,
                          color: Colors.blue,
                          size: 100,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          )),
      bottomSheet: Container(
        width: size.width,
        height: size.height * 0.2,
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.05,
                ),
                const Icon(Icons.location_on_outlined),
                SizedBox(
                  width: size.width * 0.25,
                ),
                Column(
                  children: const [
                    Text(
                      "Gbèdjromèdé Carrefour Sita",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "Rue XZ4688",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            customStepButton(size, "ADD LOCATION", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
          ],
        ),
      ),
    );
  }
}
