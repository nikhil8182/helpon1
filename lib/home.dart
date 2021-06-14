import 'package:helpon/bedVacancyWebView.dart';
import 'package:helpon/CmQrPage.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Humanity Foundation Qr page.dart';
import 'getVacinatedWebView.dart';
import 'networking.dart';
import 'package:flutter_svg/flutter_svg.dart';




Network network = Network();
// ignore: camel_case_types, must_be_immutable
class home extends StatefulWidget {
Color clr = Colors.white;


  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
   Timer timer;
   String json;

  Duration get duration => Duration(seconds: 2);

  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      getData();

    });

    super.initState();
  }
  var json1;
  bool isTrue = false;
  bool ex = false;


  Future getData() async {
    json = await network.getJson();

    setState(() {
      json1 = jsonDecode(json);
      isTrue =
      json1['Total_Recovery'] != null ? true : false;
    });
  }
  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE9E9EB),
          body: isTrue
              ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(
                  height: mediaHeight*0.02,
                ),
                CasesOverView(mediaHeight: mediaHeight),
                // SizedBox(
                //   height: 1,
                // ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Tamil Nadu",
                    style: TextStyle(
                        fontSize: mediaHeight * 0.02,
                        color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: mediaHeight*0.025,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    caseContainer(
                        mediaHeight,
                        "Total cases",
                        json1['Total_Case'],
                        Color(0xFFFF65E6)),
                    caseContainer(mediaHeight, "Total recovered",
                        json1['Total_Recovery'], Colors.green),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    caseContainer(
                      mediaHeight,
                      "Total Deaths",
                      json1['Total_Death'],
                      Color(0xFFF67272),
                    ),
                    caseContainer(
                      mediaHeight,
                      "today,s new cases",
                      json1['Todays_Case'],
                      Colors.blueAccent[200],
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaHeight*0.035,
                ),
                findBed(),
                SizedBox(height: mediaHeight*0.01,),
                contact(),
                SizedBox(height: mediaHeight*0.001,),
                // helpline
                getvaccinated(),
                // get vacinnated

                donate(context), //donate
              ],
            ),
          )
              : Center(child: Splash())
        // body: ,
      ),
    );
  }


  Container donate(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(20).copyWith(bottom: 0),
      // width: mediaWidth*0.5,
      // padding: EdgeInsets.all(20),
      // color: Colors.green,
      height: mediaHeight*0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
              child: Text(
                "Donate",
                style: TextStyle(
                  fontSize: mediaHeight * 0.025, fontWeight: FontWeight.w600,),
              )),
          SizedBox(height: mediaHeight*00.01,),

          Row(

            // padding: EdgeInsets.only(top: 15, bottom: 12),
            // scrollDirection: Axis.horizontal,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false, // set to false
                      pageBuilder: (_, __, ___) =>
                          CmQrPage(),
                    ),
                  );
                },
                child: Container(
                  height: mediaHeight*0.07,
                  width: mediaHeight*0.19,
                  margin: EdgeInsets.only(top: 1),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFD880),
                    borderRadius:
                    BorderRadius.all(Radius.circular(15)),
                  ),

                  child: Container(
                    child: Row(
                      children: [
                        Container(
                            height: mediaHeight*0.05,
                            width: mediaWidth*0.12,
                            // color: Colors.red,
                            margin: EdgeInsets.only(
                                top: 1, left: 9),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFEABC),
                              borderRadius:
                              BorderRadius.all(
                                  Radius.circular(10)),
                            ),
                            child: Icon(
                              FontAwesomeIcons.rupeeSign,
                              color: Colors.black,
                              size: 18,
                            )),
                        // SizedBox(width: 5,),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16),
                          child: Text(
                            "CM Fund",
                            style: TextStyle(
                              fontSize: mediaHeight*0.018,
                                color: Colors.black,
                                fontWeight:
                                FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: mediaWidth*0.05,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false, // set to false
                      pageBuilder: (_, __, ___) =>
                          HmQrPage(),
                    ),
                  );
                },
                child: Container(
                  height: mediaHeight*0.07,
                  width: mediaHeight*0.19,
                  margin: EdgeInsets.only(top: 1),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFD880),
                    borderRadius:
                    BorderRadius.all(Radius.circular(15)),
                  ),

                  child: Container(
                    child: Row(
                      children: [
                        Container(
                            height: mediaHeight*0.05,
                            width: mediaWidth*0.12,
                            margin: EdgeInsets.only(
                                top: 1, left: 9),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFEABC),
                              borderRadius:
                              BorderRadius.all(
                                  Radius.circular(10)),
                            ),
                            child: Icon(
                              FontAwesomeIcons.rupeeSign,
                              color: Colors.black,
                              size: 18,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 11),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Humanity",
                                style: TextStyle(
                                    fontSize:  mediaHeight*0.018,
                                    color: Colors.black,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                              Text(
                                "foundation",
                                style: TextStyle(
                                    fontSize: mediaHeight*0.018,
                                    color: Colors.black,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),



            ],
          ),


        ],
      ),
    );
  }


  getvaccinated() {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false, // set to false
            pageBuilder: (_, __, ___) =>
                GetVacinatedWebView(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        height: mediaHeight*0.09,
        width: mediaWidth*0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: new LinearGradient(
              colors: [
                const Color(0xFFDF4065),
                const Color(0xFFFCC87D),
              ],
              begin: const FractionalOffset(0.15, 0.0),
              end: const FractionalOffset(1.0, 0.5),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            Container(
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  // color: Colors.white30,
                    borderRadius:
                    BorderRadius.all(Radius.circular(20))),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child: Icon(
                          Icons.bed_outlined,
                          size: 55,
                        )))),
            Padding(
              padding: const EdgeInsets.all(21.0),
              child: Text(
                "Get Vaccinated",
                style: TextStyle(fontSize: 25,),
              ),
            ),
            //bed vacancy
          ],
        ), // get vacinated
      ),
    );

  }

  Container caseContainer(
      double mediaHeight, String title, String value, Color clr) {
    return Container(
      width: 170,
      height: mediaHeight*0.085,
      // color: Colors.red,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),

        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: new LinearGradient(
            colors: [

              const Color(0xFFFFFFFF),
              const Color(0xFFF6DEDF),
            ],
            begin: const FractionalOffset(0.7, 0.4),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 5),
              child: Text(
                title,
                style: TextStyle(
                // color: Colors.white,
                  // fontSize: ,
                ),
              )),
          SizedBox(
            height: mediaHeight*0.008,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(top: 3, left: 5),
            child: Text(
              value.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
              style: TextStyle(fontSize: 19, color: clr),
            ),
          ),
        ],
      ),
    );
  }
}

class contact extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    _makingPhoneCall(int number) async {
      var url = 'tel:${number.toString()}';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    return Container(
      // color: Colors.green,
      height: mediaHeight*0.15,
      width: mediaHeight*0.397,
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.headset_mic_outlined,color: Color(0xFFE04066),),
              SizedBox(
                width: 15,

              ),
              Text(
                "Contact Helpline",
                style: TextStyle(
                    fontSize: mediaHeight*0.025,
                    // color: Colors.white,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: mediaHeight*0.036,
                    margin: EdgeInsets.only(left: 20),
                    // color: Colors.green,
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: 20, top: 13),
                      child: Text(
                        "State Helpline",
                        style: TextStyle(
                            fontSize: mediaHeight*0.019,
                            fontWeight: FontWeight.w400,
                            // color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    // color: Colors.green,
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: 20, top: 0),
                      child: Text(
                        "104",
                        style: TextStyle(
                          fontSize: mediaHeight*0.019,
                            // color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: GestureDetector(
                  onTap: () {
                    print("making call to 104");
                    _makingPhoneCall(104);
                  },
                  child: Icon(
                    Icons.phone,
                    color: Color(0xFFE04066),
                  ),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    // color: Colors.green,
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: 20, top: 13),
                      child: Text(
                        "Covid-19 Helpline",
                        style: TextStyle(
                          fontSize: mediaHeight*0.019,
                            fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    // color: Colors.green,
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: 20, top: 0),
                      child: Text(
                        "94443-40496",
                        style: TextStyle(
                          fontSize: mediaHeight*0.019,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: GestureDetector(
                  onTap: () {
                    _makingPhoneCall(9444340496);
                  },
                  child: Icon(
                    Icons.phone,
                    color: Color(0xFFE04066),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class findBed extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return GestureDetector(onTap: (){
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false, // set to false
          pageBuilder: (_, __, ___) =>
              BedVacancyWebView(),
        ),
      );
    },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        height: mediaHeight*0.15,
        width: mediaWidth*0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF290149),
                const Color(0xFFDB3F65),
              ],
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(1.0, 0.5),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            Container(
                height: mediaHeight*0.09,
                width: mediaWidth*0.2,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius:
                    BorderRadius.all(Radius.circular(20))),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child: Icon(
                          Icons.bed_outlined,
                          color: Colors.white,
                          size: 55,
                        )))),
            Padding(
              padding: const EdgeInsets.all(21.0),
              child: Text(
                "Find Bed Vacancy",
                style: TextStyle(fontSize: mediaHeight*0.03,color: Colors.white),
              ),
            ),
            //bed vacancy
          ],
        ),
      ),
    );
  }
}

class CasesOverView extends StatelessWidget {

  const CasesOverView({

    @required this.mediaHeight,
  }) ;

  final double mediaHeight;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "Case overview",
            style: TextStyle(fontSize: mediaHeight * 0.025,),
          ),
        ),

      ],
    );
  }
}

// child: isTrue
//       ? value(
//     values:
//     //    http://34.83.46.202/cyberhome/home.php?username=api&query=update&button=tamilNadu_Covid_Todays_Covid_Case&button_value=192
//     json1['tamilNadu_Covid_Todays_Covid_Case'] !=
//         null
//         ? json1[
//     'tamilNadu_Covid_Todays_Covid_Case']
//         : "".toString(),
//   )
//       : Center(child: CircularProgressIndicator())),

// ],
// ),

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Center(child: Image.asset("images/help-on-logo-only.png",height: MediaQuery.of(context).size.height*0.37,)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: Image.asset("images/Untitled-4.jpg.png",width: 200,),
          )
        ],
      ),
    );
  }
}