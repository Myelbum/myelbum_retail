import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/screens/authentication/register/retail_sign_up/buisness_opening.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

class BuisnessName extends StatefulWidget {
  const BuisnessName({super.key});

  @override
  State<BuisnessName> createState() => _BuisnessNameState();
}

class _BuisnessNameState extends State<BuisnessName> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            'Enter your Business Name',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25.0,
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            margin: const EdgeInsets.only(left: 45.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kenobi is no more available.....',
                      style: TextStyle(
                          color: Color(int.parse('4F4F4F', radix: 16))
                              .withOpacity(1.0),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 16.0),
                    RichText(
                      text: TextSpan(
                          text: "Choose:  ",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Kenobi006 , Kenobi88 , Kenobi Ismael ",
                              style: TextStyle(
                                  color: Palette.appThemeColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300),
                            )
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 155.0),
          customStepButton(size, "NEXT", () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BuisnesOpeningHour()));
          }),
          const Spacer(),
        ],
      ),
    );
  }
}
