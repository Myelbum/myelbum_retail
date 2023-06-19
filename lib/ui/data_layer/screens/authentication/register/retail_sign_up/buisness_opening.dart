import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/data_layer/screens/authentication/register/retail_sign_up/buisness_location.dart';
import 'package:myelbum_retail/ui/data_layer/screens/main_pages/set_currency_rate.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';
import 'package:myelbum_retail/ui/data_layer/widgets/switch_widget.dart';

class BuisnesOpeningHour extends StatefulWidget {
  const BuisnesOpeningHour({super.key});

  @override
  State<BuisnesOpeningHour> createState() => _BuisnesOpeningHourState();
}

class _BuisnesOpeningHourState extends State<BuisnesOpeningHour> {
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
          "Set your business opening hours",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 31.0,
              ),
              const CustomSwitchWidget(
                day: "Mon",
              ),
              const SizedBox(
                height: 40.0,
              ),
              const CustomSwitchWidget(
                day: "Tue",
              ),
              const SizedBox(
                height: 40.0,
              ),
              const CustomSwitchWidget(
                day: "Wed",
              ),
              const SizedBox(
                height: 40.0,
              ),
              const CustomSwitchWidget(
                day: "Thu",
              ),
              const SizedBox(
                height: 40.0,
              ),
              const CustomSwitchWidget(
                day: "Fri",
              ),
              const SizedBox(
                height: 40.0,
              ),
              const CustomSwitchWidget(
                day: "Sat",
              ),
              const SizedBox(
                height: 40.0,
              ),
              const CustomSwitchWidget(
                day: "Sun",
              ),
              const SizedBox(
                height: 31.0,
              ),
              customStepButton(size, "NEXT", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SetCurrencyRate(
                              callBack: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BuisnessLocation()));
                              },
                            )));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
