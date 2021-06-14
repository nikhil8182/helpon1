import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clipboard/clipboard.dart';
import 'package:vibration/vibration.dart';
import 'package:upi_india/upi_india.dart';

import 'home.dart';

class HmQrPage extends StatefulWidget {
  @override
  _HmQrPageState createState() => _HmQrPageState();
}

String copy = 'copy';

class _HmQrPageState extends State<HmQrPage> {
  _makingPhoneCall(int number) async {
    var url = 'tel:${number.toString()}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "9078600498@ybl",
      receiverName: 'Md Azharuddin',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: 1.00,
    );
  }

  UpiIndia _upiIndia = UpiIndia();

  List<UpiApp> apps;
  // UpiApp app = UpiApp.paytm;
  @override
  void initState() {
    copy = 'copy';
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });

    super.initState();
  }

  void checkVibration() async {
    if (await Vibration.hasVibrator()) {
      print(
          ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${Vibration.vibrate()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mediaHeight * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  CupertinoIcons.back,
                  size: mediaHeight * 0.035,
                ),
              ),
              // SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Image.asset(
                    "images/WhatsApp Image 2021-06-04 at 6.16.52 PM.png",
                    width: mediaWidth * 0.25,
                    height: mediaHeight * 0.09,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _makingPhoneCall(7904938782);
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 20,
                                top: 1,
                              ),
                              child: Container(
                                  child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.phone,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: mediaWidth * 0.02,
                                  ),
                                  Text(
                                    "79049 38782",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaHeight * 0.025,
                      ),
                      GestureDetector(
                        onTap: () {
                          _makingPhoneCall(9500699220);
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 20,
                                top: 1,
                              ),
                              child: Container(
                                  child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.phone,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: mediaWidth * 0.02,
                                  ),
                                  Text(
                                    "95006 99220",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 20),
                child: Text("Humanity Foundation, Pollachi",
                    style: TextStyle(
                        fontSize: mediaHeight * 0.03,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 20),
                child: Text(
                  "Refusing to help someone is refusing work of God.",
                  // style: TextStyle( fontWeight: FontWeight.w500)
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 8),
                child: Text(
                    '''On behalf of the Humanity Foundation we are giving away 200 food parcels a week to the poor and needy and we are giving rice and groceries every month to the needy family and we are also providing free Kabasura water to 1000 people every week.''',
                    style: TextStyle(
                        // fontSize: 21,
                        // fontWeight: FontWeight.w500
                        )),
              ),
              SizedBox(
                height: mediaHeight * 0.03,
              ),
              Center(
                child: new Image.asset(
                  "images/WhatsApp Image 2021-06-04 at 6.16.52 PM.png",
                  width: mediaWidth * 0.12,
                  height: mediaHeight * 0.05,
                ),
              ),
              SizedBox(
                height: mediaHeight * 0.01,
              ),
              Center(
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Humanity Foundation, Pollachi",
                          style: TextStyle(
                              fontSize: mediaHeight * 0.02,
                              fontWeight: FontWeight.w500)),
                      // Container(child: Text("upi id: tncmprf@iob",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),),
                      SizedBox(
                        height: mediaHeight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("UPI ID: hmfund@ybl"),
                          SizedBox(
                            width: mediaWidth * 0.04,
                          ),
                          GestureDetector(
                              onTap: () async {
                                if (await Vibration
                                    .hasCustomVibrationsSupport()) {
                                  Vibration.vibrate(duration: 50);
                                } else {
                                  Vibration.vibrate();
                                  await Future.delayed(
                                      Duration(milliseconds: 500));
                                  Vibration.vibrate();
                                }
                                print("entering hm");

                                alert();
                                print("exiting hm");
                                FlutterClipboard.copy('hmfund@ybl')
                                    .then((value) => print('copied'));
                                setState(() {
                                  copy = 'copied!';
                                });
                              },
                              child: Text(
                                copy,
                                style: TextStyle(color: Colors.red),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: mediaHeight * 0.03,
                      ),
                      Container(
                        child: QrImage(
                          data:
                              'upi://pay?ver=01&pa=hmfund@ybl&pn=Humanity Foundation Pollachicd..',
                          version: QrVersions.auto,
                          size: mediaHeight * 00.26,
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
                height: mediaHeight * 0.01,
              ),
              Center(
                  child: Text(
                "Use this code to send money from any UPI App",
                style: TextStyle(color: Colors.redAccent),
              )),
              SizedBox(
                height: mediaHeight * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await LaunchApp.openApp(
                          androidPackageName:
                              'com.google.android.apps.nbu.paisa.user',
                          openStore: false);
                    },
                    child: Image.asset(
                      "images/google-pay-gpay-logo.png",
                      height: mediaHeight * 0.045,
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
                      height: mediaHeight * 0.095,
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
                      height: mediaHeight * 0.095,
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
      ),
    );
  }
}

class alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
