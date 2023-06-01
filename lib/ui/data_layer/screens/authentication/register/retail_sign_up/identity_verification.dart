import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/screens/authentication/register/retail_sign_up/buisness_profil.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

class IdentityVerification extends StatefulWidget {
  const IdentityVerification({super.key});

  @override
  State<IdentityVerification> createState() => _IdentityVerificationState();
}

class _IdentityVerificationState extends State<IdentityVerification> {
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
          "Identity verification",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: RichText(
                      text: const TextSpan(
                        text: ' ',
                        children: <TextSpan>[
                          TextSpan(
                            text: 'To verifiy your identity, we need a',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              fontSize: 10.0,
                            ),
                          ),
                          TextSpan(
                            text: ' valid ID Document.',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                            ),
                          ),
                          TextSpan(
                            text:
                                '  This can be one of the following documents',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildDot(),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "An international passport",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildDot(),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "A Inational National ID Card",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildDot(),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Driving license",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Upload ID Dcocument",
                    style: TextStyle(
                      color: Palette.appThemeColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Document number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Expiry date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Place of issue',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 42.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showAlertDialog(
                            context,
                            size,
                            const Text(
                              "Confirm Phone Number?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 10.0),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Do you want to use  +229 96608009 as phone number for this businesss?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.0),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const BuisnessProfil()));
                                          },
                                          child: Text(
                                            "yes",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Palette.appThemeColor,
                                                fontSize: 10.0),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "No, Add new number",
                                            style: TextStyle(
                                                color: Palette.appThemeColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Palette.appThemeColor),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23.46),
                            ),
                          ),
                          fixedSize: MaterialStatePropertyAll(
                              Size(size.width, size.height * 0.065))),
                      child: const Text(
                        "NEXT",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
