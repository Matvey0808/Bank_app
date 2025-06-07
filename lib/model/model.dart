import 'package:flutter/material.dart';

class CardBank {
  final String svgAssetPath; // Путь к SVG-фону карты
  final String cardNumberHidden; // Замаскированный номер карты
  final String cardholderName; // Имя владельца карты
  final String expiryDate; // Срок действия карты
  final String
  cardTypeLogoPath; // Путь к SVG-логотипу типа карты (Mastercard, Visa)
  final String chipLogoPath; // Путь к SVG-изображению чипа
  final Color backgroundColor; // Цвет фона карты
  final Color textColor; // Цвет текста на карте

  CardBank({
    required this.svgAssetPath,
    required this.cardNumberHidden,
    required this.cardholderName,
    required this.expiryDate,
    required this.cardTypeLogoPath,
    required this.chipLogoPath,
    this.backgroundColor = const Color(0xFF2E2E3A),
    this.textColor = Colors.white,
  });
}
