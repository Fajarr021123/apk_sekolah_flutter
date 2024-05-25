import 'package:flutter/material.dart';
import '../../kelas/kelas.dart'; // Pastikan Anda telah membuat file ini
import '../../pelajaran/pelajaran.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/images/pelajaran.png", "text": "Pelajaran"},
      {"icon": "assets/images/kelas1.png", "text": "Kelas"},
      {"icon": "assets/images/info.png", "text": "Info"},
      {"icon": "assets/images/akademik.png", "text": "Akademik"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              switch (categories[index]["text"]) {
                case "Pelajaran":
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PelajaranScreen(),
                    ),
                  );
                  break;
                case "Kelas":
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ClassListScreen(),
                    ),
                  );
                  break;
                case "Info":
                  // Tambahkan fungsi untuk menangani ketika "Info" dipilih
                  break;
                case "Akademik":
                  // Tambahkan fungsi untuk menangani ketika "Akademik" dipilih
                  break;
                case "More":
                  // Tambahkan fungsi untuk menangani ketika "More" dipilih
                  break;
                default:
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String icon, text;
  final GestureTapCallback press;

  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
                icon), // Menggunakan Image.asset untuk menampilkan gambar
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
