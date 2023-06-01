




import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/data_layer/screens/main_pages/homepage.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

import '../../../../comon/palette.dart';


///La classe ConfirmRecoveryEmail est un widget StatefulWidget qui représente la page de confirmation de récupération d'e-mail ou de vérification de numéro de téléphone.
///
class ConfirmRecoveryEmail extends StatefulWidget {
  const ConfirmRecoveryEmail({Key? key, this.isMail = false}) : super(key: key);

  final bool isMail;

  @override
  State<ConfirmRecoveryEmail> createState() => _ConfirmRecoveryEmailState();
}

/// La classe _ConfirmRecoveryEmailState est l'état associé à ConfirmRecoveryEmail
/// 
class _ConfirmRecoveryEmailState extends State<ConfirmRecoveryEmail> {

  ///Les FocusNode et les TextEditingController sont initialisés 
  ///dans la méthode initState() pour gérer les champs de texte et les focus.

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
        title:  Text(
       widget.isMail?   "Confirm your mail":"Verify your phone Number",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 50.0),
            const Center(
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 80.0,
                child: Center(
                    child:   Icon(Icons.mail, size: 40.0, color: Colors.white,),

                ),
              ),
            ),
            const SizedBox(height: 50.0),
              Center(
              child: Text(
                "A 5 digits code has been sent to ‘’ \n${widget.isMail? 'Mail': 'Phone Nunber'}’’",
                style:const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
              Center(
              child: Text(
                "Please check your ${widget.isMail? 'email': 'SMS'} and enter \nthe code here",
                style:const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 21.0),
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
                    const SizedBox(height: 60.0),
                    customStepButton(size, "VERIFY", () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreateNewPassword() ));
                    })
                  ],
                ),
              ),
            ),

            const SizedBox(height: 5.0),
          ],
        ),
      ),),
    );
  }
}

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
          "Create new password",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 50.0),
            const Center(
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 80.0,
                child: Center(
                  child:   Icon(Icons.numbers, size: 40.0, color: Colors.white,),

                ),
              ),
            ),
            const SizedBox(height: 50.0),
            const  Center(
              child: Text(
                "A 5 digits code has been sent to ‘’ \nMail’’",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const  Center(
              child: Text(
                "Your new password must be different \nfrom your previous password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
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
            const SizedBox(height: 21.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextFormField(

                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {

                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New password',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
            // const  Spacer(),
            const SizedBox(height: 30.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextFormField(

                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {

                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
            // const  Spacer(),
            const SizedBox(height: 40.0),
            customStepButton(size, "SAVE", (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage() ));
            }),

            const  SizedBox(height: 10.0),

          ],
        ),
      ),),
    );
  }
}

