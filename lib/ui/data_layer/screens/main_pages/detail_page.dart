import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

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
          'New Sale',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              const SizedBox(height: 16),
              buildRow(
                  Text(
                    'Customer',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.38),
                      fontSize: 12.0,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Ezekiel H.',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(0.58),
                          fontSize: 12.0,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showAlertDialog(
                              context,
                              size,
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.green,
                                      ),
                                    )
                                  ]),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Call via",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    _buildSimpleContainer(
                                        Icons.phone, "Téléphone"),
                                    _buildSimpleContainer(
                                        Icons.phone_iphone, "WhatsApp")
                                  ],
                                ),
                              ),
                              size.height * 0.25);
                        },
                        child: Text(
                          '+22997892406',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Palette.appThemeColor,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  size),
              const Divider(),
              const SizedBox(height: 16),
              buildRow(
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
              const SizedBox(height: 16),
              buildRow(
                  Text(
                    'Item',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.38),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    'E-Frame',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.58),
                      fontSize: 12.0,
                    ),
                  ),
                  size),
              const Divider(),
              const SizedBox(height: 16),
              buildRow(
                  Text(
                    'Storage capacity',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.38),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    '4 Contents',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.58),
                      fontSize: 12.0,
                    ),
                  ),
                  size),
              const Divider(),
              const SizedBox(height: 16),
              buildRow(
                  Text(
                    'Plan',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.38),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    'All-Go',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.58),
                      fontSize: 12.0,
                    ),
                  ),
                  size),
              const Divider(),
              const SizedBox(height: 16),
              buildRow(
                  Text(
                    'Expiry',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.38),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    ' Oct 12, 2024  (18 Months)',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.58),
                      fontSize: 12.0,
                    ),
                  ),
                  size),
              const Divider(),
              const SizedBox(height: 16),
              buildRow(
                  Text(
                    'TOTAL',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.38),
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    '\$3,99',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.58),
                      fontSize: 12.0,
                    ),
                  ),
                  size),
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                'Expires in 2mn31s',
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 26),
              const Text(
                'SAFETY TIP',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'For your transaction safety, Only \nproceed sale after customer has paid.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 11.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: OutlinedButton(
                        onPressed: () {
                          // Actions pour le bouton REJECT
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1),
                          fixedSize: Size(size.width * 0.3, size.height * 0.07),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('REJECT'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () {
                          // Actions pour le bouton SELL
                          showAlertDialog(
                            context,
                            size,
                            const Text(
                              "SALE COMPLETED SUCCESSFULLY",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 10.0,
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 5.0,
                                ),
                                SizedBox(
                                    height: 54,
                                    width: size.width * 0.4,
                                    child: customStepButton(
                                      size,
                                      "OK",
                                      () {
                                        Navigator.pop(context);
                                      },
                                    )),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width * 0.3, size.height * 0.07),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('SELL'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildSimpleContainer(IconData icon, String text) => Column(
        children: [
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(
              icon,
              color: Colors.green,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                )
              ],
            ),
          ),
        ],
      );
}
