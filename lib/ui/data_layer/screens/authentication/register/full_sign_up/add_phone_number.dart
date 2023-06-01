

import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/data_layer/screens/authentication/register/retail_sign_up/phone_number_verification.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';
import 'package:myelbum_retail/ui/data_layer/widgets/intl_phone_number_widget.dart';

class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({super.key});

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Add Phone Number",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: InkWell(
            onTap:   () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const RSPhoneNumberVerification()));
          },
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 28.0,
                ),

                const  Padding(
                  padding:  EdgeInsets.all(20.0),
                  child:  Text(
                    "Adding Phone number will make it easier to find those of your contacts using MyElbum!",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ),


                const Spacer(),
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: const IntlPhoneNumberWidget(),
                ),
                const SizedBox(
                  height: 62.0,
                ),
                customStepButton(size, "NEXT", null),
                const SizedBox(
                  height: 62.0,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
