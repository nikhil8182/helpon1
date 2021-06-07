import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class BedVacancyWebView extends StatefulWidget {


  @override
  _BedVacancyWebViewState createState() => _BedVacancyWebViewState();
}

class _BedVacancyWebViewState extends State<BedVacancyWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://stopcorona.tn.gov.in/beds.php',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
