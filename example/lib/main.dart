import 'package:electronic_id_card/models/info_column_model.dart';
import 'package:flutter/material.dart';
import 'package:electronic_id_card/electronic_id_card.dart';

void main() {
  runApp(ElectronicIDCardExampleApp());
}

class ElectronicIDCardExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Electronic ID Card Example')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: IDCardLayout1(
                  firstName: 'Lukas',
                  lastName: 'Mueller',
                  qrCodeNumber: 'L0300T35',
                  photoUrl: 'https://via.placeholder.com/150',
                  listInfo: [
                    InfoColumnModel(title: 'ID Number', info: 'L0300T35'),
                    InfoColumnModel(title: 'Birth date', info: '06/09/2001'),
                    InfoColumnModel(title: 'Nationality', info: 'Germany'),
                    InfoColumnModel(title: 'Expiration Date', info: '03/11/2032'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
