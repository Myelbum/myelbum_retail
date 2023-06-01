import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:myelbum_retail/ui/data_layer/screens/authentication/register/retail_sign_up/phone_number_verification.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';
import 'package:myelbum_retail/ui/data_layer/widgets/intl_phone_number_widget.dart';

class BuisnessProfil extends StatefulWidget {
  const BuisnessProfil({super.key});

  @override
  State<BuisnessProfil> createState() => _BuisnessProfilState();
}

class _BuisnessProfilState extends State<BuisnessProfil> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();

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
          "Business Profile",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const Spacer(),
              const Text(
                "Add a profile photo for your business",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 28.0,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/CHOOSE PICTURE.png'),
                radius: 50, // ajustez le rayon en fonction de vos besoins
              ),
              const SizedBox(
                height: 64.0,
              ),
              const Text(
                "Enter your business phone number",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              const Text(
                "A Number where Buyers can reach you",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 10.0,
                ),
              ),
              const SizedBox(
                height: 62.0,
              ),
              Container(
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IntlPhoneNumberWidget(
                        externalController: _phoneController,
                        onInputChanged: (PhoneNumber nummber) {
                          if (kDebugMode) {
                            print('phone nummber ${_phoneController.text}');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 62.0,
              ),
              customStepButton(size, "NEXT", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const RSPhoneNumberVerification()));
              }),
              const SizedBox(
                height: 62.0,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
