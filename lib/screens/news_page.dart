import 'package:auto_size_text/auto_size_text.dart';
import '../widgets/news_widgets/news_tile.dart';
import '../widgets/news_widgets/news_page_carousel.dart';
import '../api/api_news.dart';
import '../api/exceptions.dart';
import '../widgets/skeletons/news_list_skeleton.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  final imgPath;
  final Color color;

  NewsScreen({Key key, this.imgPath, this.color}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String dropDownValue = "publishedAt";
  ApiClient _client = ApiClient();
  Future<dynamic> _newsFuture;

  getNews() async {
    var json;
    try {
      json = await _client.getNewsResponse(dropDownValue);
    } on FetchDataException catch (fde) {
      return fde;
    }
    var articles = json['articles'];
    return articles;
  }

  refresh() async {
    await Future.delayed(Duration(milliseconds: 800), () {
      setState(() {
        _newsFuture = getNews();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _newsFuture = getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: AutoSizeText(
          "Berita Terbaru Covid-19",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Montserrat",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          stepGranularity: 2,
          maxFontSize: 20,
          minFontSize: 14,
          maxLines: 1,
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 26,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                _newsFuture = null;
                refresh();
              });
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
              size: 26,
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: LayoutBuilder(
            builder: (ctx, constraint) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Carousel
                ImageCarousel(
                  height: constraint.maxHeight * 0.26,
                ),
                //Divider
                Divider(
                  color: Colors.black,
                  height: 25,
                  thickness: 2,
                ),
//Sorting + drop down
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    //Sort by
                    Padding(
                      padding: MediaQuery.of(context).size.width > 360.0
                          ? EdgeInsets.only(left: 20)
                          : EdgeInsets.only(left: 0),
                      child: LimitedBox(
                        maxWidth: 68,
                        child: AutoSizeText(
                          "Sort by",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          stepGranularity: 2,
                          maxFontSize: 18,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                        width:
                            MediaQuery.of(context).size.width > 340.0 ? 10 : 7),
                    Expanded(
                        child: const Icon(
                      Icons.filter_list,
                      size: 26,
                    )),
                    SizedBox(width: 10),
                    //DropDown
                    Container(
                      width: constraint.maxWidth * 0.63,
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      child: Center(
                        child: Theme(
                          data: ThemeData(
                            canvasColor: Colors.black,
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            itemHeight: 50,
                            value: dropDownValue,
                            underline: Container(
                              height: 0,
                            ),
                            elevation: 20,
                            iconSize: 28,
                            icon: const Icon(
                              Icons.expand_more,
                              color: Colors.white,
                            ),
                            items: <DropdownMenuItem<String>>[
                              const DropdownMenuItem(
                                value: "publishedAt",
                                child: SizedBox(
                                  width: 55,
                                  child: AutoSizeText(
                                    "Terbaru",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 17,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              const DropdownMenuItem(
                                value: "Populer",
                                child: SizedBox(
                                  width: 68,
                                  child: AutoSizeText(
                                    "Populer",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 17,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              const DropdownMenuItem(
                                value: "Minngu lalu",
                                child: SizedBox(
                                  width: 90,
                                  child: AutoSizeText(
                                    "Minggu lalu",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 17,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              const DropdownMenuItem(
                                value: "15 hari yang lalu",
                                child: SizedBox(
                                  width: 99,
                                  child: AutoSizeText(
                                    "15 hari yang lalu",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 17,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              const DropdownMenuItem(
                                value: "Bulan lalu",
                                child: SizedBox(
                                  width: 97,
                                  child: AutoSizeText(
                                    "Bulan lalu",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 17,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (String newValue) {
                              setState(() {
                                dropDownValue = newValue;
                                _newsFuture = getNews();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Divider
                Divider(
                  color: Colors.black,
                  height: 25,
                  thickness: 2,
                ),

                //News tiles
                Expanded(
                  child: FutureBuilder<dynamic>(
                    future: _newsFuture,
                    builder: (context, snapshot) {
                      return (snapshot.data == null ||
                              snapshot.connectionState != ConnectionState.done)
                          ? NewsListLoader()
                          : ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemCount: 10,
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: (snapshot.data is FetchDataException)
                                      ? 20
                                      : 40,
                                  color: Colors.black,
                                  thickness: 2,
                                );
                              },
                              itemBuilder: (context, index) {
                                if (snapshot.data is FetchDataException) {
                                  return Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: AutoSizeText(
                                        snapshot.data.toString(),
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        maxFontSize: 16,
                                        stepGranularity: 2,
                                      ),
                                    ),
                                  );
                                }
                                return NewsTile(article: snapshot.data[index]);
                              },
                            );
                    },
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
