import 'package:flutter/material.dart';
import 'home_category.dart';
import 'package:auto_size_text/auto_size_text.dart';

// ignore: must_be_immutable
class HomeCategories extends StatelessWidget {
  const HomeCategories();
  static AutoSizeGroup titleGrp = AutoSizeGroup();
  static AutoSizeGroup descGrp = AutoSizeGroup();

  static List<Map<String, dynamic>> categoryData = [
    {
      "imgLeft": 5.0,
      "imgBottom": 19.0,
      "imgHeight": 122.0,
      "imgPath": "assets/stats/stats.png",
      "tabName": "Statistik",
      "tabDesc": "Lihat perkembangan kasus Covid-19 di Dunia",
      "color": Colors.deepPurpleAccent,
    },
    {
      "imgLeft": 15.0,
      "imgBottom": -8.0,
      "imgHeight": 150.0,
      "imgPath": "assets/symptoms/symptoms.png",
      "tabName": "Gejala",
      "tabDesc": "Ketahui apa saja gejala Covid-19",
      "color": Colors.teal[800],
    },
    {
      "imgPath": "assets/prevention/boy.png",
      "imgHeight": 140.0,
      "imgLeft": 15.0,
      "imgBottom": 0.0,
      "tabName": "Tindakan Pencegahan",
      "tabDesc": "Cara yang dapat dilakukan sebagai bentuk pencegahan",
      "color": Colors.lightBlue[700],
    },
    {
      "imgPath": "assets/myths/myths.png",
      "imgBottom": -30.0,
      "imgLeft": 20.0,
      "imgHeight": 170.0,
      "tabName": "Mitos Covid-19",
      "tabDesc": "Singkirkan asumsi yang salah dari Covid-19",
      "color": Colors.redAccent[700],
    },
    {
      "imgBottom": 10.0,
      "imgLeft": 3.0,
      "tabName": "Virus",
      "imgHeight": 130.0,
      "tabDesc": "Ketahui lebih banyak tentang Covid-19",
      "imgPath": "assets/corona.png",
      "color": Colors.orange[700],
    },
    {
      "imgBottom": -4.0,
      "imgLeft": 8.0,
      "imgPath": "assets/news/newsl.png",
      "tabName": "Berita",
      "imgHeight": 146.0,
      "tabDesc": "Lihat berita terbaru seputar Covid-19",
      "color": Colors.greenAccent[700],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryData.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var cat = categoryData[index];
        return CategoryTab(
          titleGrp: titleGrp,
          descGrp: descGrp,
          imgPath: cat["imgPath"],
          imgBottom: cat["imgBottom"],
          imgHeight: cat["imgHeight"],
          imgLeft: cat["imgLeft"],
          tabDesc: cat["tabDesc"],
          tabName: cat["tabName"],
          color: cat["color"],
        );
      },
    );
  }
}
