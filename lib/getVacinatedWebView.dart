import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class GetVacinatedWebView extends StatefulWidget {


  @override
  _BedVacancyWebViewState createState() => _BedVacancyWebViewState();
}

class _BedVacancyWebViewState extends State<GetVacinatedWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://selfregistration.cowin.gov.in/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
