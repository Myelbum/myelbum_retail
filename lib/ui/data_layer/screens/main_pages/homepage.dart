import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSales = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {},
          child: Icon(Icons.menu, color: Palette.appThemeColor),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: RichText(
          text: TextSpan(
              text: "MyElbum",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Palette.appThemeColor,
                fontSize: 25.0,
              ),
              children: [
                TextSpan(
                  text: " Retail Partner",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Palette.appThemeColor,
                    fontSize: 10.0,
                  ),
                )
              ]),
        ),
        actions: [
          Icon(Icons.notifications, color: Palette.appThemeColor),
          Icon(Icons.more_vert, color: Palette.appThemeColor),
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50.0,
              ),
              const Center(
                child: Text(
                  "Fred Print",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSales = true;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sales',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: isSales
                                ? Theme.of(context).primaryColor
                                : Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        if (isSales)
                          Container(
                            width: 45.0,
                            height: 2.0,
                            color: Palette.appThemeColor,
                          )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSales = false;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Stock',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: isSales
                                ? Colors.black87
                                : Palette.appThemeColor,
                            fontSize: 15.4,
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        if (!isSales)
                          Container(
                            width: 45.0,
                            height: 2.0,
                            color: Palette.appThemeColor,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 47.0),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  elevation: 0,
                  value: "Today Sales",
                  icon: Transform.rotate(
                    angle: 1.5,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.chevron_right,
                          size: 12, color: Colors.black),
                    ),
                  ),
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 15),
                  onChanged: (String? newValue) {},
                  items: <String>["Today Sales"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 50.0),
              const Center(
                child: Text(
                  "148.125 XOF",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 45.0,
              ),
              customStepButton(size, "NEW SALE", () {
                /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));*/
              }),
              const SizedBox(
                height: 30.0,
              ),
              const Center(
                child: Text(
                  "Sales Distrisbution",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      underline: const SizedBox.shrink(),
                      elevation: 0,
                      value: "From yesterday",
                      icon: Transform.rotate(
                        angle: 1.5,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.chevron_right,
                              size: 12, color: Colors.black),
                        ),
                      ),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 15),
                      onChanged: (String? newValue) {},
                      items: <String>["From yesterday"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      underline: const SizedBox.shrink(),
                      elevation: 0,
                      value: "To Today",
                      icon: Transform.rotate(
                        angle: 1.5,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.chevron_right,
                              size: 12, color: Colors.black),
                        ),
                      ),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 15),
                      onChanged: (String? newValue) {},
                      items: <String>["To Today"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              DataTable(columns: const [
                DataColumn(
                  label: Text(
                    "Items",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 11.0,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Vol. (CFA)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 11.0,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Trans. ID",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 11.0,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Date.Time",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ], rows: const [
                DataRow(cells: [
                  DataCell(
                    Text(
                      "New frame",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "2000,00",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "AJyu78i6",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "Today 10:14 AM",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(
                    Text(
                      "Frame Ext.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "1785,00",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "BC78fdtJ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      "Today 9:14 AM",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ])
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'View more',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Container(
                    width: 45.0,
                    height: 2.0,
                    color: Palette.appThemeColor,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
