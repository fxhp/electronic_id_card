import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronic_id_card/models/card_info_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'info_column.dart';

class IDCardLayout extends StatelessWidget {
  final CardInfoModel cardInfoModel;
  final double width;
  final double photosWidth;
  final double photosHeight;

  const IDCardLayout({
    super.key,
    required this.cardInfoModel,
    this.width = 300,
    this.photosWidth = 200,
    this.photosHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return _buildCardLayout();
  }

  Widget _buildCardLayout() {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: photosWidth,
              height: photosHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: cardInfoModel.photoUrl,
                  placeholder: (_, __) => const CircularProgressIndicator(),
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardInfoModel.isValid
                    ? const Icon(
                        Icons.check_circle_outlined,
                        size: 24.0,
                        color: Colors.green,
                      )
                    : const SizedBox.shrink(),
                const SizedBox(width: 16),
                Text(
                  "${cardInfoModel.firstName} ${cardInfoModel.lastName}",
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoColumn(
                  title: "ID Number",
                  info: cardInfoModel.idCardNumber,
                ),
                InfoColumn(
                  title: "Birth date",
                  info: cardInfoModel.birthdate,
                  isAlignEnd: true,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoColumn(
                  title: "Nationality",
                  info: cardInfoModel.nationality,
                ),
                InfoColumn(
                  title: "Expiration date",
                  info: cardInfoModel.expDate,
                  isAlignEnd: true,
                ),
              ],
            ),
            const SizedBox(height: 16),
            QrImageView(
              data: cardInfoModel.idCardNumber,
              version: QrVersions.auto,
              size: width,
            ),
          ],
        ),
      ),
    );
  }
}

class IDCardLayoutCompact extends StatelessWidget {
  final CardInfoModel cardInfoModel;
  final double width;

  const IDCardLayoutCompact({
    super.key,
    required this.cardInfoModel,
    this.width = 300,
  });

  @override
  Widget build(BuildContext context) {
    return _buildCardLayoutCompact();
  }

  Widget _buildCardLayoutCompact() {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: cardInfoModel.photoUrl,
                      placeholder: (_, __) => const CircularProgressIndicator(),
                      errorWidget: (_, __, ___) => const Icon(Icons.error),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: QrImageView(
                          data: cardInfoModel.idCardNumber,
                          version: QrVersions.auto,
                        ),
                      ),
                    ),
                    cardInfoModel.isValid
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle_outlined,
                                size: 16.0,
                                color: Colors.green,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "VALID",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: InfoColumn(
                  title: "Name",
                  info: cardInfoModel.firstName,
                ),
              ),
              Expanded(
                flex: 2,
                child: InfoColumn(
                  title: "ID Number",
                  info: cardInfoModel.idCardNumber,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InfoColumn(
                  title: "Last name",
                  info: cardInfoModel.lastName,
                ),
              ),
              Expanded(
                flex: 1,
                child: InfoColumn(
                  title: "Nationality",
                  info: cardInfoModel.nationality,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InfoColumn(
                  title: "Birth date",
                  info: cardInfoModel.birthdate,
                ),
              ),
              Expanded(
                flex: 1,
                child: InfoColumn(
                  title: "Expiration date",
                  info: cardInfoModel.expDate,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
