import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/screens/authentication/recovery/password_recovery.dart';

///LoginPage 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // this value is used  to keep state while user switch from mail to phone number 
  bool isMail = true;
// both controllers to control TextFormFields
 final TextEditingController _mailController = TextEditingController(),
      _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Text(
                    'Welcome Dear Partner!',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25.0,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const Text(
                    'Log with Retail credential to \nstart!',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.0,
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
                                color: isMail
                                    ? Colors.black87
                                    : Palette.appThemeColor,
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
                        ? TextFormField(
                            key: const ValueKey('mail'),
                            controller: _mailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Mail',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          )
                        : TextFormField(
                            key: const ValueKey('phone'),
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 44.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          suffixIcon: TextButton(
                            onPressed: () {},
                            child: const Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PasswordRecovery()));
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.grey),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23.46),
                            ),
                          ),
                          fixedSize: MaterialStatePropertyAll(
                              Size(size.width, size.height * 0.065))),
                      child: const Text(
                        "CONTINUE",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
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
                  const SizedBox(height: 8.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23.46),
                          ),
                          side: BorderSide(
                              width: 2, color: Palette.appThemeColor),
                          fixedSize: Size(size.width, size.height * 0.065),
                          backgroundColor: Colors.white),
                      onPressed: () async {},
                      child: Row(children: [
                        Image.asset(
                          "assets/images/google(2) 1.png",
                          width: 30.0,
                          height: 30.0,
                        ),
                        Flexible(child: Container()),
                        Text(
                          'Sign in With google',
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
                  const SizedBox(height: 15.0),
                  Container(
                    width: 200.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2.0)),
                  ),
                  const SizedBox(height: 5.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
