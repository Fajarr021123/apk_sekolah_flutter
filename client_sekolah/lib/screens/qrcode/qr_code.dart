import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'qr_image.dart';

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

class GenerateUniqueCodeScreen extends StatefulWidget {
  const GenerateUniqueCodeScreen({Key? key}) : super(key: key);
  static String routeName = "/qr_code";

  @override
  _GenerateUniqueCodeScreenState createState() =>
      _GenerateUniqueCodeScreenState();
}

class _GenerateUniqueCodeScreenState extends State<GenerateUniqueCodeScreen> {
  String? selectedClass;
  String? selectedSubject;
  String? selectedMeetingNumber;

  List<String> getSubjectsForClass(String? className) {
    return pelajaranData
        .where((data) => data['kelas'] == className)
        .map((data) => data['nama']!)
        .toList();
  }

  void generateUniqueCode() {
    if (selectedClass != null &&
        selectedSubject != null &&
        selectedMeetingNumber != null) {
      String generatedCode = generateUniqueCodeHelper(
          selectedClass!, selectedSubject!, selectedMeetingNumber!);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QRCodeScreen(qrData: generatedCode),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please select all fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  String generateUniqueCodeHelper(
      String className, String subjectName, String meetingNumber) {
    String combinedString = '$className-$subjectName-$meetingNumber';

    final key = encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1');
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(combinedString, iv: iv);
    return encrypted.base64;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Unique Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Class'),
              items: pelajaranData
                  .map((data) => data['kelas']!)
                  .toSet()
                  .toList()
                  .map((kelas) {
                return DropdownMenuItem<String>(
                  value: kelas,
                  child: Text(kelas),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedClass = value;
                  selectedSubject = null; // Reset subject when class changes
                });
              },
              value: selectedClass,
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Subject'),
              items: getSubjectsForClass(selectedClass).map((subject) {
                return DropdownMenuItem<String>(
                  value: subject,
                  child: Text(subject),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSubject = value;
                });
              },
              value: selectedSubject,
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Meeting Number'),
              items: List.generate(14, (index) {
                return DropdownMenuItem<String>(
                  value: (index + 1).toString(),
                  child: Text('Meeting ${index + 1}'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMeetingNumber = value;
                });
              },
              value: selectedMeetingNumber,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateUniqueCode,
              child: Text('Generate Unique Code'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
