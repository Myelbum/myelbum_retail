


import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

import 'add_phone_number.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddPhoneNumber() ));
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100.0),
                InkWell(
                  onTap: (){
                  },
                  child:const Center(
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Center(
                  child: Text(
                    "Create your password",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ),

                //  const  Spacer(),
                const SizedBox(height: 67.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(

                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {

                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon:const Icon(Icons.visibility_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                // const  Spacer(),
                const SizedBox(height: 30.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child:  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 35.0),
                    child:  const Text('Password requirements: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child:  Container(
                    margin:const EdgeInsets.only(left: 35.0),
                    child:  Column(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              buildDot(),
                              const SizedBox(
                                width: 10.0,
                              ),
                              const Text(
                                "must contain at least 8 characters",
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
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              buildDot(),
                              const SizedBox(
                                width: 10.0,
                              ),
                              const Text(
                                "with at least one number or symbol",
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
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              buildDot(),
                              const SizedBox(
                                width: 10.0,
                              ),
                              const Text(
                                "with both Upper and lower case",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ),


                const SizedBox(height: 67.0),
                customStepButton(size, "NEXT", null),

                const  SizedBox(height: 150.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
