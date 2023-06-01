

import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/screens/authentication/register/full_sign_up/password.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

class FillProfil extends StatefulWidget {
  const FillProfil({Key? key}) : super(key: key);

  @override
  State<FillProfil> createState() => _FillProfilState();
}

class _FillProfilState extends State<FillProfil> {
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
          "Fill your profile",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const PasswordPage() ));
          },
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
                  height: 62.0,
                ),
                 Align(
                  alignment: Alignment.centerLeft,
                  child:  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 35.0),
                    child:const Text(
                      "Username",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),

                    decoration: InputDecoration(
                      label:const Text("Kenobis"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  margin: const EdgeInsets.only(left: 45.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kenobi is no more available.....',
                            style: TextStyle(
                                color: Color(int.parse('4F4F4F', radix: 16))
                                    .withOpacity(1.0),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 16.0),
                          RichText(
                            text: TextSpan(
                                text: "Choose:  ",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Kenobi006 , Kenobi88 , Kenobi Ismael ",
                                    style: TextStyle(
                                        color: Palette.appThemeColor,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w300),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 22.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child:  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 35.0),
                    child:const Text(
                      "Birthday Date",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child:  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 35.0),
                    child: const Text(
                      "Your birthday won’t be shown publicly",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),

                //TODO ADD PLUGIN TO MANAGE DATEFILTER
                const SizedBox(height: 67.0),
                customStepButton(size, "NEXT", null),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
