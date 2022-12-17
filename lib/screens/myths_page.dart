import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class MythsScreen extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );

  final imgPath;

  final Color color;

  List<Map<String, String>> myths = [
    {
      "myth": "Penyakit SARS-CoV-2 TIDAK DAPAT ditularkan melalui gigitan nyamuk",
      "desc": "Ini adalah virus pernapasan yang menyebar terutama " +
          "melalui tetesan batuk atau bersin orang yang terinfeksi," +
          " air liur atau keluarnya cairan dari hidung.",
      "imgPath": "assets/myths/mosquito.png",
    },
    {
      "myth":
          "Virus COVID-19 dapat menular di daerah dengan iklim panas dan lembab",
      "desc":
          "Tidak ada alasan untuk percaya bahwa cuaca panas dapat membunuh virus corona baru" +
              " atau penyakit lainnya. Itu dapat ditularkan dalam iklim apa pun.",
      "imgPath": "assets/myths/hot.png",
    },
    {
      "myth": "Bawang putih TIDAK melindungi dari infeksi virus corona",
      "desc": "Bawang putih mungkin memiliki beberapa sifat anti mikroba." +
          " Namun, tidak ada bukti yang menunjukkan bahwa bawang putih" +
          " dapat melindungi orang dari virus COVID-19.",
      "imgPath": "assets/myths/garlic.png",
    },
    {
      "myth": "Antibiotik TIDAK bekerja melawan virus, hanya bakteri",
      "desc": "Coronavirus baru (2019-nCoV) adalah virus dan karenanya, " +
          "antibiotik tidak boleh digunakan sebagai sarana pencegahan atau pengobatan.",
      "imgPath": "assets/myths/antibiotics.png",
    },
    {
      "myth": "Paket dari China TIDAK BISA menyebarkan virus corona",
      "desc":
          "Para ilmuwan percaya bahwa virus tidak dapat bertahan hidup pada surat atau paket" +
              " untuk waktu yang lama. Ada sangat " +
              "risiko penyebaran yang rendah dari produk atau paket yang dikirim",
      "imgPath": "assets/myths/package.png",
    },
    {
      "myth": "Kucing dan anjing TIDAK menyebarkan virus corona",
      "desc":
          "Saat ini, hanya ada sedikit bukti yang menunjukkan bahwa SARS-CoV-2 dapat menginfeksi" +
              " kucing dan anjing. Para ilmuwan masih berdebat" +
              " pentingnya kasus ini untuk wabah Covid.",
      "imgPath": "assets/myths/dogs.png",
    },
    {
      "myth": "Semua kelompok umur BISA menghubungi SARS-CoV-2",
      "desc": "Itu dapat menginfeksi orang-orang dari segala usia, termasuk anak-anak." +
          " Namun, orang dewasa yang lebih tua dan individu dengan kondisi kesehatan sebelumnya" +
          " lebih mungkin untuk menjadi sakit parah.",
      "imgPath": "assets/myths/ages.png",
    },
  ];

  MythsScreen({Key key, this.imgPath, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: <Widget>[
          //Cover Image Container
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              color: color.withOpacity(0.2),
            ),
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
                          "Mitos Covid-19",
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
                      ),
                    ),
                  ),

                  //Image
                  Positioned.fill(
                    bottom: -17.0,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                            tag: imgPath,
                            child: Image(
                              image: AssetImage(imgPath),
                              height: constraint.maxHeight * 0.93,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Myth card
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 15),
              width: MediaQuery.of(context).size.width > 360.0
                  ? MediaQuery.of(context).size.width - 31.0
                  : MediaQuery.of(context).size.width,
              child: Material(
                borderRadius: BorderRadius.circular(15.0),
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    //Details
                    Flexible(
                      fit: FlexFit.loose,
                      child: PageView.builder(
                          controller: controller,
                          physics: BouncingScrollPhysics(),
                          itemCount: myths.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.fromLTRB(23, 35, 23, 15),
                              child: LayoutBuilder(
                                builder: (ctx, constraint) => Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    LimitedBox(
                                      maxHeight: constraint.maxHeight * 0.27,
                                      child: Image(
                                        image: AssetImage(
                                            "${myths[index]["imgPath"]}"),
                                        height: 100.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: constraint.maxHeight * 0.11,
                                    ),
                                    LimitedBox(
                                      maxHeight: constraint.maxHeight * 0.17,
                                      child: AutoSizeText(
                                        "${myths[index]["myth"]}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 19,
                                          height: 1.1,
                                          fontFamily: "Montserrat",
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxFontSize: 20,
                                        stepGranularity: 2,
                                        maxLines: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 13,
                                    ),
                                    LimitedBox(
                                      maxHeight: constraint.maxHeight * 0.45,
                                      child: AutoSizeText(
                                        "${myths[index]['desc']}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16.5,
                                          height: 1.4,
                                          fontFamily: "Montserrat",
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxFontSize: 16.5,
                                        stepGranularity: 1.5,
                                        maxLines: 6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),

                    //Dot Indicator
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: myths.length,
                        effect: WormEffect(
                            dotHeight: 11,
                            dotWidth: 11,
                            spacing: 12.0,
                            strokeWidth: 1.2,
                            dotColor: Colors.grey[400],
                            paintStyle: PaintingStyle.stroke,
                            activeDotColor: Colors.redAccent[700]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
