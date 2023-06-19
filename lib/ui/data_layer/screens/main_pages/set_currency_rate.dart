import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

class SetCurrencyRate extends StatefulWidget {
  const SetCurrencyRate({super.key, required this.callBack});

  final Function() callBack;

  @override
  State<SetCurrencyRate> createState() => _SetCurrencyRateState();
}

class _SetCurrencyRateState extends State<SetCurrencyRate> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Set Currency Rate',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "Set Currency Rate",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.58),
                  fontSize: 25.0,
                ),
              ),
              const SizedBox(
                height: 45.0,
              ),
              const Text(
                "Your area Currency is XOF (Republic of Benin Republic)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 11.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "You can still edit later",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 12.0,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "€1 =",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                      child: SizedBox(
                    width: size.width * 0.8,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        hintText: 'Type Business rate',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10.0),
                      ),
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 90.0,
              ),
              customStepButton(size, "NEXT", widget.callBack)
            ],
          ),
        ),
      ),
    );
  }
}
