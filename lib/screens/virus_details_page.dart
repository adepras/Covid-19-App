import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VirusDetailsScreen extends StatelessWidget {
  final imgPath;
  final Color color;

  static List<Map<String, String>> details = [
    {
      "detail": "Pengantar",
      "desc":
          "Coronavirus adalah virus RNA untai tunggal yang terbungkus dan positif. " +
              "Itu milik subfamili Coronavirus, seperti namanya, dengan" +
              " ciri khas paku “mirip mahkota” di permukaannya.",
    },
    {
      "detail": "Asal",
      "desc": "Virus ini diyakini berasal akhir tahun lalu di pasar makanan" +
          " di kota Wuhan di Cina yang menjual satwa liar secara ilegal. Kesehatan" +
          " para ahli berpikir itu mungkin berasal dari kelelawar dan kemudian diteruskan ke manusia," +
          " mungkin melalui spesies hewan lain.\n\nAda juga laporan bahwa " +
          "inang perantara bisa jadi trenggiling."
    },
    {
      "detail": "Seberapa berbahayanya?",
      "desc": "Infeksi virus corona memiliki beberapa gejala, termasuk demam, " +
          "batuk, sesak napas, dan kesulitan bernapas.\n\nTidak jelas seberapa mematikan" +
          " virus baru adalah. Meskipun kasus yang parah dapat menyebabkan pneumonia dan kematian, mungkin ada" +
          " banyak kasus penyakit yang lebih ringan tidak terdeteksi. Banyak dari mereka yang telah meninggal memiliki" +
          " kondisi medis sebelumnya atau lansia dengan sistem kekebalan yang lemah.",
    },
    {
      "detail": "Bagaimana cara penularannya?",
      "desc": "Virus corona baru dapat ditularkan dari orang ke orang, meskipun demikian" +
          " tidak jelas betapa mudahnya itu terjadi.\n\nPenularan kemungkinan besar terjadi melalui kontak dekat" +
          "dengan orang yang terinfeksi melalui partikel di udara dari batuk atau bersin, atau oleh" +
          "seseorang menyentuh orang yang terinfeksi atau objek dengan virus di atasnya dan kemudian menyentuh" +
          " mulut, hidung atau mata mereka.",
    },
    {
      "detail": "Apakah ada vaksin untuk virus corona?",
      "desc": "Sampai saat ini, tidak ada obat khusus yang direkomendasikan untuk mencegah atau mengobati virus corona baru." +
          "Namun, mereka yang terinfeksi virus harus mendapat perawatan yang tepat untuk meredakannya" +
          " dan mengobati gejala\n\nBeberapa perawatan khusus sedang diselidiki, dan akan diuji" +
          " uji klinis. Beberapa dokter sedang mencoba ramuan anti-retroviral dan flu yang manjur" +
          " obat-obatan untuk mengobati mereka yang terinfeksi, tetapi sains tidak meyakinkan apakah mereka " +
          "efektif.",
    },
  ];

  static AutoSizeGroup titleGrp = AutoSizeGroup();
  static AutoSizeGroup descGrp = AutoSizeGroup();

  const VirusDetailsScreen({Key key, this.imgPath, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
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
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: pageHeight,
        child: Column(
          children: <Widget>[
            //image tag container
            Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  color: color.withOpacity(0.2)),
              width: MediaQuery.of(context).size.width,
              child: LayoutBuilder(
                builder: (ctx, constraint) => Stack(
                  children: <Widget>[
                    //Title
                    Positioned(
                      top: constraint.maxHeight * 0.45,
                      left: 20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: constraint.maxWidth * 0.55,
                          child: AutoSizeText(
                            "SARS-CoV-2",
                            style: TextStyle(
                              color: color,
                              fontFamily: "Montserrat",
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                            stepGranularity: 2,
                            maxFontSize: 30,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),

                    //Image
                    Positioned.fill(
                      right: -90,
                      bottom: -30,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                              tag: imgPath,
                              child: Image(
                                image: AssetImage(imgPath),
                                height: constraint.maxHeight * 0.92,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Details List
            Container(
              height: pageHeight - 220,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                itemCount: details.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: LayoutBuilder(
                      builder: (ctx, constraint) => LimitedBox(
                        maxWidth: constraint.maxWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            AutoSizeText(
                              "${details[index]["detail"]}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: "Montserrat",
                                color: color,
                                fontWeight: FontWeight.w700,
                              ),
                              maxFontSize: 28,
                              stepGranularity: 2,
                              maxLines: 3,
                              group: titleGrp,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AutoSizeText(
                              "${details[index]['desc']}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.5,
                                fontFamily: "Montserrat",
                                color: Colors.grey[850],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                              ),
                              maxFontSize: 18,
                              group: descGrp,
                              stepGranularity: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
