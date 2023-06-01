import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/screens/authentication/register/retail_sign_up/buisness_name.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';
import 'package:otp_autofill/otp_autofill.dart';

class RSPhoneNumberVerification extends StatefulWidget {
  const RSPhoneNumberVerification({super.key});

  @override
  State<RSPhoneNumberVerification> createState() =>
      _RSPhoneNumberVerificationState();
}

class _RSPhoneNumberVerificationState extends State<RSPhoneNumberVerification> {
  late OTPTextEditController controller;
  final scaffoldKey = GlobalKey();
  late OTPInteractor _otpInteractor;

  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List<FocusNode>.generate(4, (index) => FocusNode());
    _controllers = List<TextEditingController>.generate(
      4,
      (index) => TextEditingController(),
    );
    _otpInteractor = OTPInteractor();
    _otpInteractor.getAppSignature().then((value) {
      //  print('signature - $value');
    });
    controller = OTPTextEditController(
      codeLength: 5,
      onCodeReceive: (code) {
      //  print('Your Application receive code - $code');
      },
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{4})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        strategies: [
          SampleStrategy(),
        ],
      );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

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
          "Phone number verification",
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
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(left: 35.0),
                  child: const Text(
                    "A 4 digits code has been sent \nto your phone",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 64.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 35.0),
                  child: const Text(
                    "Type it here",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 54.0,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            4,
                            (index) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 64.0,
                                  child: TextField(
                                    controller: _controllers[index],
                                    focusNode: _focusNodes[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0),
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        if (index < 3) {
                                          _focusNodes[index + 1].requestFocus();
                                        } else {
                                          // Focus out from the last text field
                                          _focusNodes[index].unfocus();
                                        }
                                      } else {
                                        if (index > 0) {
                                          _focusNodes[index - 1].requestFocus();
                                        }
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 5.0,
                                  color: Palette.appThemeColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 27.0),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Didn’t get your code ?',
                            style: TextStyle(
                                color: Color(int.parse('4F4F4F', radix: 16))
                                    .withOpacity(1.0),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Resend',
                            style: TextStyle(
                                color: Palette.appThemeColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 56.0),
                customStepButton(size, "VERIFY", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BuisnessName()));
                }),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SampleStrategy extends OTPStrategy {
  @override
  Future<String> listenForCode() {
    return Future.delayed(
      const Duration(seconds: 4),
      () => 'Your code is 5432',
    );
  }
}
