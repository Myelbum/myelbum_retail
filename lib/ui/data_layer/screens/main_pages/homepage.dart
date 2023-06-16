import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/screens/main_pages/detail_page.dart';
import 'package:myelbum_retail/ui/data_layer/screens/main_pages/drawer.dart';
import 'package:myelbum_retail/ui/data_layer/screens/main_pages/stock_select.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

enum SaleMenu { print, close }

enum StockMenu { forwardVolume, print, closeBuisness }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSales = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const MyDrawer(),
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Palette.appThemeColor,
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
          InkWell(
              onTap: () {
                showAlertDialog(
                    context,
                    size,
                    const Text(""),
                    Column(
                      children: [
                        const Text(
                          "Your Business is\ncurrently close",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 17.0,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                            height: 54,
                            child: customStepButton(
                              size,
                              "Open business",
                              () {},
                            )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          "KEEP CLOSE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    size.height * 0.2);
              },
              child: Icon(Icons.notifications, color: Palette.appThemeColor)),
          isSales
              ? PopupMenuButton<SaleMenu>(
                  child: Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: const Icon(Icons.more_vert_outlined)),
                  // Callback that sets the selected popup menu item.
                  onSelected: (SaleMenu item) async {
                    if (item.index == 0) {
                    } else {}
                    setState(() {});
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SaleMenu>>[
                        const PopupMenuItem<SaleMenu>(
                          value: SaleMenu.print,
                          child: Text("Print"),
                        ),
                        const PopupMenuItem<SaleMenu>(
                          value: SaleMenu.close,
                          child: Text('Close'),
                        ),
                      ])
              : PopupMenuButton<StockMenu>(
                  child: Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: const Icon(Icons.more_vert_outlined)),
                  // Callback that sets the selected popup menu item.
                  onSelected: (StockMenu item) async {
                    if (item.index == 0) {
                    } else {}
                    setState(() {});
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<StockMenu>>[
                        const PopupMenuItem<StockMenu>(
                          value: StockMenu.forwardVolume,
                          child: Text("Transfer Volume"),
                        ),
                        const PopupMenuItem<StockMenu>(
                          value: StockMenu.print,
                          child: Text('Print'),
                        ),
                        const PopupMenuItem<StockMenu>(
                          value: StockMenu.closeBuisness,
                          child: Text('Close Business'),
                        ),
                      ])
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
               Center(
                child: InkWell(
                  onTap: (){
                      
                  },
                  child:const Text(
                    "Fred Print",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
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
              Center(
                child: Text(
                  isSales ? "148.125 XOF" : "\$18.00",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              if (!isSales) const SizedBox(height: 10.0),
              if (!isSales)
                const Center(
                  child: Text(
                    "Available now",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF50555C),
                      fontSize: 13.0,
                    ),
                  ),
                ),
              const SizedBox(
                height: 45.0,
              ),
              customStepButton(size, isSales ? "NEW SALE" : "PURCHASE VOLUME",
                  () async {
                if (isSales) {
                  showAlertDialog(
                      context,
                      size,
                      null,
                      Column(
                        children: [
                          Container(
                            width: size.width,
                            height: 25.0,
                            alignment: Alignment.center,
                            color: Colors.grey,
                            child: const Text(
                              "ENTER ORDER ID",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/images/Rectangle 367.png",
                                  fit: BoxFit.fill,
                                  color: Colors.black,
                                  height: 35.0,
                                  width: 35.0,
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: size.width * 0.45,
                              height: 40,
                              child: const TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                              height: 54,
                              child: customStepButton(
                                size,
                                "Continue",
                                () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DetailPage()));
                                },
                              )),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                      size.height * 0.3);
                } else {
                  var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectStock()));

                  if (result == "showAlert") {
                    // ignore: use_build_context_synchronously
                    showAlertDialog(
                        context,
                        size,
                        null,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Center(
                              child: Text(
                                "VOLUME PURCHASED SUCCESSFULLY",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                            const Center(
                              child: Text(
                                "Old stock balance : \$18,00",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            const Center(
                              child: Text(
                                "Newly purchased volume: \$1300,00",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            const Center(
                              child: Text(
                                "Commission volume: \$286,00",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            const Center(
                              child: Text(
                                "New stock available : \$1604,00",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 54,
                                width: 100.0,
                                child: customStepButton(
                                  size,
                                  "ok",
                                  () {
                                    Navigator.pop(context);
                                  },
                                )),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                        size.height * 0.5);
                  }
                }
              }),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text(
                  isSales ? "Sales Distrisbution" : "STOCK LOG",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    if (!isSales)
                      Column(
                        children: const [
                          FittedBox(
                            child: Text(
                              "Open with :\n412.230 XOF",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF50555C),
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
              !isSales
                  ? DataTable(columnSpacing: 30.0, columns: const [
                      DataColumn(
                        label: Text(
                          "Volume",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Operation",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Oper. ID",
                          textAlign: TextAlign.center,
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
                          textAlign: TextAlign.center,
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
                            "-2000,00",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                              fontSize: 8.0,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            "Stock Transfer",
                            textAlign: TextAlign.center,
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
                            textAlign: TextAlign.center,
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
                            textAlign: TextAlign.center,
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
                            "1785,00",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                              fontSize: 8.0,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            "Credit",
                            textAlign: TextAlign.center,
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
                            textAlign: TextAlign.center,
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
                            textAlign: TextAlign.center,
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
                            "-10860,00",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                              fontSize: 8.0,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            "Sales",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 8.0,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            "-",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 8.0,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            "-",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 8.0,
                            ),
                          ),
                        ),
                      ])
                    ])
                  : DataTable(columnSpacing: 30.0, columns: const [
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
