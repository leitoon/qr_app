import 'package:flutter/widgets.dart';
import 'package:qr_app/providers/dbProvider.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.valor);
 
  if (scan.tipo == 'http') {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  } else {
    Navigator.pushNamed(context, 'mapa',arguments: scan);
  }
}