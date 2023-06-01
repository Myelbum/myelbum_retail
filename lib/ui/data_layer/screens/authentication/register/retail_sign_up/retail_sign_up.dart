import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/screens/authentication/register/retail_sign_up/identity_verification.dart';

class RetailSignUp extends StatefulWidget {
  const RetailSignUp({super.key});

  @override
  State<RetailSignUp> createState() => _RetailSignUpState();
}

class _RetailSignUpState extends State<RetailSignUp> {
  bool isMail = true;
 
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
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Mail',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          )
                        : TextFormField(
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
                  const SizedBox(height: 72.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const IdentityVerification()));
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
                              'Don\'t have account yet ? ',
                              style: TextStyle(
                                  color: Color(int.parse('4F4F4F', radix: 16))
                                      .withOpacity(1.0),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Sign up now',
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
                  const SizedBox(height: 174.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
