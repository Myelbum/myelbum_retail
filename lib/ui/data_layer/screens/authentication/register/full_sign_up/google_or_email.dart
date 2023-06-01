import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

import 'confirm_mail.dart';

class GoogleEmail extends StatefulWidget {
  const GoogleEmail({super.key});

  @override
  State<GoogleEmail> createState() => _GoogleEmailState();
}

class _GoogleEmailState extends State<GoogleEmail> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 22.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23.46),
                      ),
                      side: BorderSide(width: 2, color: Palette.appThemeColor),
                      fixedSize: Size(size.width, size.height * 0.065),
                      backgroundColor: Colors.white),
                  onPressed: () async {
                    //ConfirmMail
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ConfirmMail() ));
                  },
                  child: Row(children: [
                    Image.asset(
                      "assets/images/google(2) 1.png",
                      width: 30.0,
                      height: 30.0,
                    ),
                    Flexible(child: Container()),
                    Text(
                      'Use google',
                      style: TextStyle(
                          letterSpacing: 1.0,
                          color: Palette.appThemeColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w900),
                    ),
                    Flexible(child: Container()),
                  ]),
                ),
              ),
              const SizedBox(height: 31.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45.0,
                    height: 2.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const Text(
                    "OR",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 45.0,
                    height: 2.0,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 57.0),
              customStepButton(
                  size,
                  "NEXT",
                  _controller.text.isNotEmpty
                      ? () {
                          showAlertDialog(
                              context,
                              size,
                              const  Text('MAIL ALREADY REGISTERED',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10.0,
                                ),),
                              Column(
                                children: [
                                  const Text('This mail is already registered .\nIf ‘entered mail’ is your account, \nsign in now to continue.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.0,
                                    ),),
                                  Container(
                                    margin:const EdgeInsets.only(right: 40.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        TextButton(onPressed: (){}, child:const Text("SIGN UP",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11.0,
                                          ),)),
                                        TextButton(onPressed: (){}, child:const Text("SIGN IN",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11.0,
                                          ),)),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        }
                      : null),
              const SizedBox(height: 28.0),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
