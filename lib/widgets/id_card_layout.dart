import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronic_id_card/models/info_column_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'info_column.dart';

class IDCardLayout1 extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String qrCodeNumber;
  final String photoUrl;
  final List<InfoColumnModel> listInfo;
  final double width;
  final bool isLayoutDetail;

  const IDCardLayout1({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.qrCodeNumber,
    required this.listInfo,
    required this.photoUrl,
    this.width = 300,
    this.isLayoutDetail = false,
  });

  bool isNetworkImage(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

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
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: photoUrl,
                  placeholder: (_, __) => const CircularProgressIndicator(),
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Icon(
                  Icons.check_circle_outlined,
                  size: 24.0,
                  color: Colors.green,
                ),
                const SizedBox(width: 16),
                Text(
                  "$firstName $lastName",
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5 / 1,
              ),
              itemCount: listInfo.length,
              itemBuilder: (context, index) {
                final data = listInfo[index];
                final isEven = (index + 1) % 2 == 0;
                return InfoColumn(
                  title: data.title,
                  info: data.info,
                  isAlignEnd: isEven,
                );
              },
            ),
            QrImageView(
              data: qrCodeNumber,
              version: QrVersions.auto,
              size: width,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildCardLayoutDetail() {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: photoUrl,
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
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: QrImageView(
                      data: qrCodeNumber,
                      version: QrVersions.auto,
                    ),
                  ),
                ),
              ),
            ],
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.5 / 1,
            ),
            itemCount: listInfo.length,
            itemBuilder: (context, index) {
              final data = listInfo[index];
              final isEven = (index + 1) % 2 == 0;
              return InfoColumn(
                title: data.title,
                info: data.info,
                isAlignEnd: isEven,
              );
            },
          ),
        ],
      ),
    );
  }
}
