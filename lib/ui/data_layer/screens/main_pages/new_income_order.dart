import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/screens/main_pages/detail_page.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

class NewIncomeOrder extends StatefulWidget {
  const NewIncomeOrder({super.key});

  @override
  State<NewIncomeOrder> createState() => _NewIncomeOrderState();
}

class _NewIncomeOrderState extends State<NewIncomeOrder> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Palette.appThemeColor,
              width: size.width,
              height: size.height * 0.5,
              alignment: Alignment.center,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "NEW INCOME \nORDER",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    CircleAvatar(
                      radius: 50.0,
                      child: Text(
                        "00:29",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.5,
              padding: const EdgeInsets.all(2.0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Fulgence D.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    "Cotonou",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: const ListTile(
                      title: Text("Item:"),
                      trailing: Text("E-Frame"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: const ListTile(
                      title: Text("Price:"),
                      trailing: Text("\$6.99"),
                    ),
                  ),
                  const SizedBox(
                    height: 45.0,
                  ),
                  customStepButton(size, "ACCEPT", () {
                    buildPage(context, const DetailPage());
                  }),
                  const SizedBox(
                    height: 10.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
