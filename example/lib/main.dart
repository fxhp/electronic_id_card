import 'package:electronic_id_card/models/card_info_model.dart';
import 'package:flutter/material.dart';
import 'package:electronic_id_card/electronic_id_card.dart';

void main() {
  runApp(ElectronicIDCardExampleApp());
}

final CardInfoModel cardData = CardInfoModel(
    firstName: 'Lukas',
    lastName: 'Mueller',
    idCardNumber: 'L0300T35',
    photoUrl: 'https://via.placeholder.com/150',
    birthdate: '06/09/2001',
    nationality: 'Germany',
    expDate: '03/11/2032',
    isValid: true);

class ElectronicIDCardExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Electronic ID Card'),
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
                      MaterialPageRoute(builder: (context) => CardLayout()),
                    );
                  },
                  child: Text('Go to Card Layout'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CompactLayout()),
                    );
                  },
                  child: Text('Go to Compact Layout'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Electronic ID Card')),
      body: SingleChildScrollView(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Electronic ID Card Compact')),
      body: SingleChildScrollView(
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
