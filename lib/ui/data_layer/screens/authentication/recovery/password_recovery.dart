import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';
import 'package:myelbum_retail/ui/data_layer/widgets/intl_phone_number_widget.dart';

import '../../../../comon/palette.dart';
import 'confirm_recovery_email.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({Key? key}) : super(key: key);

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  bool isMail = true;

  final TextEditingController _controller = TextEditingController();

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
          "Recover your account",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: 80.0,
                  child: Center(
                      child: RotatedBox(
                    quarterTurns: -6,
                    child: Icon(
                      Icons.info_outline_rounded,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
              const SizedBox(height: 50.0),
              const Center(
                child: Text(
                  "Please enter your phone number or mail \nto recover your account.",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMail = true;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Mail',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: isMail
                                ? Theme.of(context).primaryColor
                                : Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        if (isMail)
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
                        isMail = false;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color:
                                isMail ? Colors.black87 : Palette.appThemeColor,
                            fontSize: 15.4,
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        if (!isMail)
                          Container(
                            width: 100.0,
                            height: 2.0,
                            color: Palette.appThemeColor,
                          )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 21.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                child: isMail
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: _controller,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            labelText: 'Mail',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      )
                    : IntlPhoneNumberWidget(
                        externalController: _phoneController,
                        onInputChanged: (PhoneNumber nummber) {
                          if (kDebugMode) {
                            print('phone nummber ${_phoneController.text}');
                          }
                        },
                      ),
              ),
              const SizedBox(height: 66.79),
              customStepButton(
                  size,
                  "NEXT",
                  isMail
                      ? _controller.text.isEmpty
                          ? null
                          : () {
                              showAlertDialog(
                                  context,
                                  size,
                                  const Text(
                                    'ACCOUNT NOT FOUND',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'We can’t find the account with \n‘’ entered mail.’’',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      const Text(
                                        '  Try another phone number or \nmail or sign up',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ConfirmRecoveryEmail()));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 40.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    "SIGN UP",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11.0,
                                                    ),
                                                  )),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    "TRY AGAIN",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11.0,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ));
                            }
                      : _phoneController.text.isEmpty
                          ? null
                          : () {
                              showAlertDialog(
                                  context,
                                  size,
                                  const Text(
                                    '',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Confirm +22996608008 as your \nphone number ?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ConfirmRecoveryEmail()));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const SizedBox(height: 20.0),
                                            Text(
                                              "CONFIRM",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11.0,
                                                  color: Palette.appThemeColor),
                                            ),
                                            const SizedBox(height: 20.0),
                                            Text(
                                              "RETYPE NUMBER",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11.0,
                                                  color: Palette.appThemeColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ));
                            }),
              const SizedBox(height: 66.79),
              RichText(
                text: TextSpan(
                  text: 'Don\'t have account yet ? ',
                  style: TextStyle(
                      color: Color(int.parse('4F4F4F', radix: 16))
                          .withOpacity(1.0),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign up Now',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        color: Palette.appThemeColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}

// Recover your raccount
