import 'package:bank_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BankCard extends StatelessWidget {
  final CardBank card;
  const BankCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        elevation: 2,
        color: card.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(card.svgAssetPath, fit: BoxFit.cover),
            ),
            Positioned(
              top: 165,
              right: 20,
              child: SvgPicture.asset(
                card.cardTypeLogoPath,
                width: 70,
                height: 45,
              ),
            ),
            Positioned(
              bottom: 165,
              left: 20,
              child: SvgPicture.asset(card.chipLogoPath, width: 50, height: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                        card.cardNumberHidden,
                        style: TextStyle(
                          color: card.textColor,
                          fontSize: 25,
                          letterSpacing: 4,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            card.cardholderName.toUpperCase(),
                            style: TextStyle(
                              color: card.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EXPIRES',
                            style: TextStyle(
                              color: card.textColor.withOpacity(0.7),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            card.expiryDate,
                            style: TextStyle(
                              color: card.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
