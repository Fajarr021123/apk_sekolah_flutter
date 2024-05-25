import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class ClassDetailScreen extends StatelessWidget {
  final String className;
  static String routeName = "/detail_kelas";

  const ClassDetailScreen({Key? key, required this.className})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int studentCount = 30; // Misalnya jumlah siswa
    final List<String> studentNames = [
      "Ahmad",
      "Budi",
      "Cici",
      "Dedi",
      "Eka",
      "Fani",
      "Gilang",
      "Hani",
      "Irfan",
      "Joko",
      "Kiki",
      "Lala",
      "Maman",
      "Nina",
      "Omar",
      "Putu",
      "Qori",
      "Rani",
      "Siti",
      "Tono",
      "Umar",
      "Vina",
      "Wawan",
      "Xena",
      "Yusuf",
      "Zara",
      "Abi",
      "Bari",
      "Caca",
      "Doni",
    ]; // Daftar nama siswa

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $className'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/student.png',
                      height: 70.0,
                      width: 70.0,
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      '$studentCount',
                      style: const TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
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
                        'Nama Siswa',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    studentNames.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(Text((index + 1).toString())),
                        DataCell(Text(studentNames[index])),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
