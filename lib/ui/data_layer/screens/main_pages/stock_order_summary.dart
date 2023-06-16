import 'package:flutter/material.dart';
import 'package:flutter_credit_card_detector/flutter_credit_card_detector.dart';
import 'package:myelbum_retail/ui/data_layer/screens/main_pages/detail_page.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

class StockOrderSummery extends StatefulWidget {
  const StockOrderSummery({super.key});

  @override
  State<StockOrderSummery> createState() => _StockOrderSummeryState();
}

class _StockOrderSummeryState extends State<StockOrderSummery> {
  List<String> listBand = [
    'visa',
    'mastercard',
    'amex',
    'elo',
    'dinersclub',
    'discover',
    'jcb',
    'aura',
    'hiper',
    'hipercard',
    'rupay'
  ];

  _onTap() async {
    print('numero de carte: $creditCardNumber');
    print('Nom: $creditCardName');
    print('Validité: $creditCardExpData');
    print('CVV: $creditCardCVV');
    print('Band: $creditCardBand');
    print('CPF: $creditCardCPF');
    Navigator.pop(context);
    Navigator.pop(context, "showAlert");
  }

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
          'Stock Order Summary',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: buildRow(
                Text(
                  'Order ID',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.38),
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  'GSVSTI786GV',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.58),
                    fontSize: 12.0,
                  ),
                ),
                size),
          ),
          const SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(
            child: buildRow(
                Text(
                  'Item',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.38),
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  '\$1300 Retail Stock',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.58),
                    fontSize: 12.0,
                  ),
                ),
                size),
          ),
          const SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(
            child: buildRow(
                Text(
                  'Retailer Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.38),
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  'FRED PRINT',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.58),
                    fontSize: 12.0,
                  ),
                ),
                size),
          ),
          const SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(
            child: buildRow(
                Text(
                  'Busines ID: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.38),
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  'AY126YG0M',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.58),
                    fontSize: 12.0,
                  ),
                ),
                size),
          ),
          const SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(
            child: buildRow(
                Text(
                  'TOTAL',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.38),
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  '\$1300,00',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.58),
                    fontSize: 12.0,
                  ),
                ),
                size),
          ),
          const SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CreditCardWidget(
                    titleCreditCard: "Credit Card",
                    labelTextValidate: "Valid until",
                    labelTextButton: "PROCEED PAYMENT",
                    textInvalidateMonth: "Incorect month",
                    labelTextCPF: "CPF of holder",
                    textRequired: "Required filed",
                    textNameMin: "6 min caraters is required",
                    onTap: _onTap),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
