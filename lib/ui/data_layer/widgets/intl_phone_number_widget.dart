import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';

/// cette classe est un widet qui permet d'accéder plus facilement au widget de phone number 
/// elle expose le controller et aussi la méthode onInputChanged de cette classe
/// de nouvelles méthodes peuvent aussi etre exposer en cas de besoin

class IntlPhoneNumberWidget extends StatefulWidget {
  const IntlPhoneNumberWidget(
      {Key? key, this.externalController, this.onInputChanged})
      : super(key: key);

  final TextEditingController? externalController;
  final void Function(PhoneNumber)? onInputChanged;

  @override
  State<IntlPhoneNumberWidget> createState() => _IntlPhoneNumberWidgetState();
}

class _IntlPhoneNumberWidgetState extends State<IntlPhoneNumberWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: Palette.appThemeColor, width: 2.0)),
            child: InternationalPhoneNumberInput(
              inputBorder: InputBorder.none,
              onInputChanged: widget.onInputChanged,
              onInputValidated: (bool value) {
                //print(value);
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              initialValue: number,
              textFieldController: widget.externalController ?? controller,
              formatInput: true,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              onSaved: (PhoneNumber number) {},
            ),
          ),
        ],
      ),
    );
  }
}
