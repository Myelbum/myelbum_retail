import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool _switchapplock = false;
  bool _switchlockSale = false;

  bool selectedTimeIsFive = true;
  bool selectedUnlockModeIsPassword = true;

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
          "Security",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: const Text("App Lock"),
              subtitle: const Text("Required code before opening App"),
              trailing: CupertinoSwitch(
                value: _switchapplock,
                activeColor: Palette.appThemeColor,
                onChanged: (value) {
                  setState(() {
                    _switchapplock = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("Lock timing"),
              subtitle: const Text("Delay before lock"),
              trailing: Text(
                "${selectedTimeIsFive ? '5' : '10'} mn",
                style: TextStyle(color: Palette.appThemeColor),
              ),
              onTap: () {
                showAlertDialog(
                    context,
                    size,
                    const SizedBox.shrink(),
                    Column(
                      children: [
                        ListTile(
                          title: const Text("5 mn"),
                          trailing: selectedTimeIsFive
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.cyan,
                                )
                              : null,
                          onTap: () {
                            setState(() {
                              selectedTimeIsFive = true;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("10 mn"),
                          trailing: !selectedTimeIsFive
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.cyan,
                                )
                              : null,
                          onTap: () {
                            setState(() {
                              selectedTimeIsFive = false;
                            });
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                    size.height * 0.15);
              },
            ),
            ListTile(
              title: const Text("Unlock mode"),
              trailing: Text(
                selectedUnlockModeIsPassword ? 'Password' : 'FingerPrint',
                style: TextStyle(color: Palette.appThemeColor),
              ),
              onTap: () {
                showAlertDialog(
                    context,
                    size,
                    const SizedBox.shrink(),
                    Column(
                      children: [
                        ListTile(
                          title: const Text("Password"),
                          trailing: selectedUnlockModeIsPassword
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.cyan,
                                )
                              : null,
                          onTap: () {
                            setState(() {
                              selectedUnlockModeIsPassword = true;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("FingerPrint"),
                          trailing: !selectedUnlockModeIsPassword
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.cyan,
                                )
                              : null,
                          onTap: () {
                            setState(() {
                              selectedUnlockModeIsPassword = false;
                            });
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                    size.height * 0.15);
              },
            ),
            ListTile(
              title: const Text("Sale Lock"),
              subtitle: const Text("Required code before processing sale"),
              trailing: CupertinoSwitch(
                value: _switchlockSale,
                activeColor: Palette.appThemeColor,
                onChanged: (value) {
                  setState(() {
                    _switchlockSale = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
