import 'package:flutter/material.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(
            160, 252, 155, 0), // Warna abu-abu untuk latar belakang
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Info Akademik',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          buildInfoItem(
            title: 'UTS',
            date: '23 - 30 Juni',
          ),
          buildInfoItem(
            title: 'Lomba Mewarnai',
            date: '30 Juni',
          ),
          buildInfoItem(
            title: 'Ujian Akhir Semester',
            date: '5 - 10 Juli',
          ),
          buildInfoItem(
            title: 'Pengumuman UTS',
            date: '15 Juli',
          ),
          buildInfoItem(
            title: 'Penerimaan Siswa Baru',
            date: '20 - 25 Juli',
          ),
        ],
      ),
    );
  }

  Widget buildInfoItem({required String title, required String date}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Tanggal: $date',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Info Akademik'),
      ),
      body: Center(
        child: SpecialOffers(),
      ),
    ),
  ));
}
