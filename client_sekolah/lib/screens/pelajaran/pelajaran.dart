import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class PelajaranScreen extends StatelessWidget {
  static const routeName = '/pelajaran';

  final List<Map<String, String>> pelajaranData = [
    {'nama': 'Matematika', 'kelas': 'Kelas 10'},
    {'nama': 'Fisika', 'kelas': 'Kelas 11'},
    {'nama': 'Kimia', 'kelas': 'Kelas 10'},
    {'nama': 'Biologi', 'kelas': 'Kelas 12'},
    {'nama': 'Bahasa Inggris', 'kelas': 'Kelas 11'},
    {'nama': 'Bahasa Indonesia', 'kelas': 'Kelas 10'},
    {'nama': 'Sejarah', 'kelas': 'Kelas 11'},
    {'nama': 'Geografi', 'kelas': 'Kelas 12'},
    {'nama': 'Ekonomi', 'kelas': 'Kelas 10'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pelajaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DataTable2(
          columnSpacing: 2,
          horizontalMargin: 2,
          minWidth: 1,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          columns: const [
            DataColumn2(
              label: Text(
                'No',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              size: ColumnSize.S,
            ),
            DataColumn(
              label: Text(
                'Nama Pelajaran',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Kelas',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: List<DataRow>.generate(
            pelajaranData.length,
            (index) => DataRow(
              color: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  // Set warna latar belakang untuk setiap baris genap
                  return index.isEven ? Colors.grey[200] : null;
                },
              ),
              cells: [
                DataCell(Text((index + 1).toString())),
                DataCell(Text(
                  pelajaranData[index]['nama']!,
                  style: TextStyle(color: Colors.blue),
                )),
                DataCell(Text(pelajaranData[index]['kelas']!)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
