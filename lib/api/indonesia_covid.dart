class IndonesiaStat {
  final int cases;
  final int deaths;
  final int recovered;
  final int todayCases;
  final int todayDeaths;
  final int todayRecovered;
  final String latestUpdated;

  IndonesiaStat(
      {this.cases,
      this.deaths,
      this.recovered,
      this.todayCases,
      this.todayDeaths,
      this.todayRecovered,
      this.latestUpdated});

  factory IndonesiaStat.fromJSON(Map<String, dynamic> json) {
    return IndonesiaStat(
      cases: json['update']['total']['jumlah_positif'],
      deaths: json['update']['total']['jumlah_meninggal'],
      recovered: json['update']['total']['jumlah_sembuh'],
      latestUpdated: json['update']['penambahan']['created'],
      todayCases: json['update']['penambahan']['jumlah_positif'],
      todayDeaths: json['update']['penambahan']['jumlah_meninggal'],
      todayRecovered: json['update']['penambahan']['jumlah_sembuh'],
    );
  }
}
