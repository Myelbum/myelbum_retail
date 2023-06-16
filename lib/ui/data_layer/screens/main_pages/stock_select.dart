import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/data_layer/screens/main_pages/stock_order_summary.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

class SelectStock extends StatefulWidget {
  const SelectStock({super.key});

  @override
  State<SelectStock> createState() => _SelectStockState();
}

class _SelectStockState extends State<SelectStock> {
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
          'Select Stock',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            _buildContainer(size, customStepButton(size, "\$1300", null),
                "Get 22% commission (+\$286)"),
            _buildContainer(size, customStepOutlinedButton(size, "\$800", null),
                "Get 17% commission (+\$136)"),
            _buildContainer(size, customStepOutlinedButton(size, "\$300", null),
                "Get 12% commission (+\$36)"),
            const Spacer(),
            customStepButton(size, "Continue", () {
              //
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StockOrderSummery()));
            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  _buildContainer(Size size, Widget button, String text) {
    return Container(
      width: size.width,
      height: size.height * 0.15,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: size.width * 0.5, child: button),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.54),
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
