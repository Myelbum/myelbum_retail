import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        backgroundColor: Palette.appThemeColor,
        elevation: 0.0,
        title: const Text(
          "Change Password",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
        actions: [
          Container(
            width: 130.0,
            height: 15.0,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: customStepOutlinedButton(size, "Save", () {}, true),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 25.0,
            ),
            Flexible(
              child: Container(
                width: size.width,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    label: Text("Enter New Password"),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Flexible(
              child: Container(
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                height: 40,
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    label: Text("Confirm New Password"),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
