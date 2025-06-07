import 'package:bank_app/cards/cardBank.dart';
import 'package:bank_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CardBank myCard = CardBank(
      svgAssetPath: "assets/images/kartaBank.svg",
      cardNumberHidden: "2202 2067 3515 8352",
      cardholderName: "Matvey Gavrilyuk",
      expiryDate: "08/35",
      cardTypeLogoPath: "assets/images/LogoMasterCard.svg",
      chipLogoPath: "assets/images/Group 5.svg",
      backgroundColor: const Color.fromARGB(255, 26, 29, 43),
      textColor: Colors.white,
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 24, 34),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/capibara.jpg"),
                    radius: 30,
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back",
                        style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      ),
                      const SizedBox(height: 1),
                      const Text(
                        "Matvey Gavrilyuk",
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BankCard(card: myCard),
          ],
        ),
      ),
    );
  }
}
