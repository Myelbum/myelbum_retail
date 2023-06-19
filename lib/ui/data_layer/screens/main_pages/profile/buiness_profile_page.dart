import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';

class BuisnessProfilePage extends StatefulWidget {
  const BuisnessProfilePage({super.key});

  @override
  State<BuisnessProfilePage> createState() => _BuisnessProfilePageState();
}

class _BuisnessProfilePageState extends State<BuisnessProfilePage> {
  bool selectedTimeIsFive = true;
  bool selectedUnlockModeIsPassword = true;

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

  List<Map<String, String>> openningHours = [
    {"day": "Monday", "hour": "09:00 to 17:00"},
    {"day": "Tuesday", "hour": "09:00 to 17:00"},
    {"day": "Wednesday", "hour": "09:00 to 17:00"},
    {"day": "Thursday", "hour": "09:00 to 17:00"},
    {"day": "Friday", "hour": "09:00 to 17:00"},
    {"day": "Saturday", "hour": "close"},
    {"day": "Sunday", "hour": "close"},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          backgroundColor: Palette.appThemeColor,
          elevation: 0.0,
          title: const Text(
            "Buisness Profile",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          actions: const [
            Icon(
              Icons.more_vert,
              color: Colors.white,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("assets/images/profile.png"),
                            radius: 50,
                          ),
                        ),
                        Text(
                          "See Reviews",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Palette.appThemeColor,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "FRED PRINT",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Palette.appThemeColor,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              Icons.star,
                              color: Palette.appThemeColor,
                              size: 15.0,
                            )
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            size: 15.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Cotonou, Bénin",
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.phone_in_talk,
                            size: 15.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "96608007",
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.mail,
                            size: 15.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "fredprint@gmail.com",
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.store,
                            size: 15.0,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "AY126YG0M",
                            style: TextStyle(
                                color: Palette.appThemeColor, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.25,
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
                      [GeoPoint(latitude: 67.111222, longitude: 37.415263)])
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.room,
                    color: Palette.appThemeColor,
                  ),
                  SizedBox(
                    width: size.width * 0.25,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
            ),
            Container(
              width: size.width,
              height: 60.0,
              color: Colors.grey,
              alignment: Alignment.center,
              child: const Text(
                "OPENNING HOURS",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            DataTable(
              columnSpacing: size.width * 0.5,
              columns: const [
                DataColumn(label: Text("Days")),
                DataColumn(label: Text("Hours"))
              ],
              rows: [
                for (int i = 0; i < openningHours.length; i++)
                  DataRow(cells: [
                    DataCell(Text(openningHours[i]["day"]!)),
                    DataCell(Text(
                      openningHours[i]["hour"]!,
                      style: TextStyle(
                          color: openningHours[i]["hour"]?.contains("close") ==
                                  true
                              ? Colors.red
                              : Colors.black),
                    ))
                  ])
              ],
            ),
          ]),
        ));
  }
}
