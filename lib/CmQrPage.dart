import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:clipboard/clipboard.dart';
import 'package:vibration/vibration.dart';
String copy = "copy";
class CmQrPage extends StatefulWidget {

  @override
  _CmQrPageState createState() => _CmQrPageState();
}

class _CmQrPageState extends State<CmQrPage> {
  @override
  void initState() {
    copy = "copy";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaHeight*0.03,
            ),
            GestureDetector(onTap: (){
              Navigator.pop(context);
            },
              child: Icon(
                CupertinoIcons.back,
                size: mediaHeight*0.035,
              ),
            ),
            // SizedBox(height: 20,),
            new Image.asset(
              "images/tngvlogo.png",
              width: mediaWidth*0.25,
              height: mediaHeight*0.1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 20),
              child: Text("Chief Minister's Public Relief Fund",
                  style: TextStyle(fontSize: mediaHeight*0.03, fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 8),
              child: Text(
                  '''CMPRF is exempt under Income Tax Act, 1961 under Section 10 and 139 for return purposes. Contributions towards CMPRF are notified for 100% deduction from taxable income under section 80(G) of the Income Tax Act, 1961.   ''',
                  style: TextStyle(
                      // fontSize: 21,
                      // fontWeight: FontWeight.w500
                      )),
            ),
            SizedBox(
              height: mediaHeight*0.05,
            ),
            Center(
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Chief Minister's Public Relief Fund",
                        style: TextStyle(
                            fontSize: mediaHeight*0.02, fontWeight: FontWeight.w500)),
                    // Container(child: Text("upi id: tncmprf@iob",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),),
                    SizedBox(
                      height: mediaHeight*0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("UPI ID: tncmprf@iob"),
                        SizedBox(
                          width: mediaWidth*0.04,
                        ),
                        GestureDetector(
                            onTap: () async{
                              if (await Vibration.hasAmplitudeControl()) {
                              Vibration.vibrate(amplitude: 128, duration: 50);
                              }
                              AlertDialog(title: Text("Sample Alert Dialog"));
                              FlutterClipboard.copy('tncmprf@iob')
                                  .then((value) => print('copied'));
                              setState(() {
                                copy ='copied!';
                              });
                            },
                            child: Text(
                              copy,
                              style: TextStyle(color: Colors.red),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: mediaHeight*0.03,
                    ),
                    Container(
                      child: QrImage(
                        data:
                            'upi://pay?ver=01&pa=tncmprf@IOB&pn=Government of Tamil Nadu - Chief Ministers Public Relief Fund&tn=Donation&am=&mode=02&purpose=00&orgid=159020&sign=&mc=9400',
                        version: QrVersions.auto,
                        size: mediaHeight*00.26,
                        backgroundColor: Colors.white30,
                        // foregroundColor: Colors.white30,
                        gapless: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: mediaHeight*0.03,
            ),
            Center(
                child: Text(
              "Use this code to send money from any UPI App",
              style: TextStyle(color: Colors.redAccent,fontSize: mediaHeight*00.019),
            )),
            SizedBox(
                height: mediaHeight*0.045
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    await LaunchApp.openApp(
                        androidPackageName: 'com.google.android.apps.nbu.paisa.user',
                        openStore: false);
                  },
                  child: Image.asset(
                    "images/google-pay-gpay-logo.png",
                    height: mediaHeight*0.045,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await LaunchApp.openApp(
                        androidPackageName: 'net.one97.paytm',
                        openStore: false);
                  },
                  child: Image.asset(
                    "images/Paytm-Logo.wine.png",
                    height: mediaHeight*0.095,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await LaunchApp.openApp(
                        androidPackageName: 'com.phonepe.app',
                        openStore: false);
                  },
                  child: Image.asset(
                    "images/PhonePe-Logo.wine.png",
                    height: mediaHeight*0.1,
                  ),
                ),
              ],
            )

            // Container(
            //   height: 75,
            //   width: 164,
            //   color: Colors.red,
            //   child: GestureDetector(onTap:()async{
            //
            //       await LaunchApp.openApp(
            //         androidPackageName: 'com.phonepe.app',
            //         openStore: false,
            //
            //       );
            //   },child: Text("open PhonePe")),
            // ),
          ],
        ),
      ),
    );
  }
}
