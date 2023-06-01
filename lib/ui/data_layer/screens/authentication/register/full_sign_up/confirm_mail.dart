

import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

import 'fill_profil.dart';

class ConfirmMail extends StatelessWidget {
  const ConfirmMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const   SizedBox(height: 172.0),
              Center(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MailAddedSuccesfuly() ));
                },
                child:const Text(
                  "Confirm your mail",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            const  SizedBox(height: 6.0),
            const  Center(
              child: Text(
                "We have sent a confirmation email to \n‘’ Entered Mail Adress ‘’ .",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 18.0),
            const  Center(
              child: Text(
                "Please check your email & click the \nlink to confirm your account. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MailAddedSuccesfuly extends StatelessWidget {
  const MailAddedSuccesfuly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 172.0),
          const Center(
              child: Text(
                "Mail adress confirmed \nsuccessfuly !",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
            ),
          const  Spacer(),
               customStepButton(size, "NEXT", (){
                 //ProvideLastAndFirstName
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProvideLastAndFirstName() ));
               }),

            const  SizedBox(height: 150.0),
          ],
        ),
      ),
    );
  }
}

class ProvideLastAndFirstName extends StatelessWidget {
  const ProvideLastAndFirstName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 172.0),
               InkWell(
                 onTap: (){
                   //FillProfil
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const FillProfil() ));
                 },
                 child:const Center(
                  child: Text(
                    "Name and Last name",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
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
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
             // const  Spacer(),
              const SizedBox(height: 67.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(

                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {

                  },
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
             // const  Spacer(),
              const SizedBox(height: 67.0),
              customStepButton(size, "NEXT", null),

              const  SizedBox(height: 150.0),
            ],
          ),
        ),
      ),
    );
  }
}


