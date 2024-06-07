import 'package:electronic_id_card/models/card_info_model.dart';
import 'package:flutter/material.dart';
import 'package:electronic_id_card/electronic_id_card.dart';

void main() {
  runApp(const ElectronicIDCardExampleApp());
}

const CardInfoModel cardData = CardInfoModel(
    firstName: 'Lukas',
    lastName: 'Mueller',
    idCardNumber: 'L0300T35',
    photoUrl: 'https://via.placeholder.com/150',
    birthdate: '06/09/2001',
    nationality: 'Germany',
    expDate: '03/11/2032',
    isValid: true);

class ElectronicIDCardExampleApp extends StatelessWidget {
  const ElectronicIDCardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Electronic ID Card'),
        ),
        body: Center(
          child: Builder(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CardLayout()),
                    );
                  },
                  child: const  Text('Go to Card Layout'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CompactLayout()),
                    );
                  },
                  child: const Text('Go to Compact Layout'),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class CardLayout extends StatelessWidget {
  const CardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Electronic ID Card')),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: IDCardLayout(cardInfoModel: cardData),
            ),
          ],
        ),
      ),
    );
  }
}

class CompactLayout extends StatelessWidget {
  const CompactLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Electronic ID Card Compact')),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: IDCardLayoutCompact(cardInfoModel: cardData),
            ),
          ],
        ),
      ),
    );
  }
}
