import 'package:covid/api/covid_api.dart';
import 'package:covid/api/indonesia_covid.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';

class StatScreen extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );
  final Color color;
  StatScreen({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final f = NumberFormat('#,###,###');
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: color,
              size: 28,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<IndonesiaStat>(
          future: CovidAPI().getIndonesiaData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Periksa koneksi anda!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    color: color,
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                      child: Container(
                        height: 230,
                        color: Color.fromARGB(30, 124, 77, 255),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 32.0, left: 32.0),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: AutoSizeText(
                                    "Perkembangan Covid-19",
                                    style: TextStyle(
                                      color: color,
                                      fontFamily: "Montserrat",
                                      fontSize: 31,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 31,
                                    maxLines: 1,
                                  ),
                                )),
                            Container(
                                alignment: Alignment.center,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: AutoSizeText(
                                    "Indonesia",
                                    style: TextStyle(
                                      color: color,
                                      fontFamily: "Montserrat",
                                      fontSize: 31,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 31,
                                    maxLines: 1,
                                  ),
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 30.0),
                                alignment: Alignment.center,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: AutoSizeText(
                                    'Last update: ${snapshot.data?.latestUpdated} WIB',
                                    style: TextStyle(
                                      color: color,
                                      fontFamily: "Montserrat",
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 19,
                                    maxLines: 1,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 300.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 32.0, left: 32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                color: color,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18.0,
                                      left: 14.0,
                                      right: 14.0,
                                      bottom: 18.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  'Aktif',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${f.format(snapshot.data?.todayCases)}',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          fontWeight: FontWeight
                                                              .normal),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                    Icon(
                                                      Icons.arrow_upward,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimaryContainer,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(children: [
                                              Text(
                                                '${f.format(snapshot.data?.cases)}',
                                                style: TextStyle(
                                                    fontSize: 35.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(height: 25),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                color: color,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18.0,
                                      left: 14.0,
                                      right: 14.0,
                                      bottom: 18.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  'Sembuh',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${f.format(snapshot.data?.todayRecovered)}',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          fontWeight: FontWeight
                                                              .normal),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                    Icon(
                                                      Icons.arrow_upward,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimaryContainer,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(children: [
                                              Text(
                                                '${f.format(snapshot.data?.recovered)}',
                                                style: TextStyle(
                                                    fontSize: 35.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(height: 25),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                color: color,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18.0,
                                      left: 14.0,
                                      right: 14.0,
                                      bottom: 18.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  'Meninggal',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${f.format(snapshot.data?.todayDeaths)}',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          fontWeight: FontWeight
                                                              .normal),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                    Icon(
                                                      Icons.arrow_upward,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimaryContainer,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(children: [
                                              Text(
                                                '${f.format(snapshot.data?.deaths)}',
                                                style: TextStyle(
                                                    fontSize: 35.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
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
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
