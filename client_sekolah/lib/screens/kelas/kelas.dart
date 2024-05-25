import 'package:flutter/material.dart';
import 'detail_kelas.dart';
import 'components/kelas_menu.dart';

class ClassListScreen extends StatelessWidget {
  static const routeName = '/kelas';

  const ClassListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kelas"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            KelasMenu(
              text: "Kelas 1",
              icon: "assets/icons/kelas.svg",
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ClassDetailScreen(
                      className: "Kelas 1",
                    ),
                  ),
                )
              },
            ),
            KelasMenu(
              text: "Kelas 2",
              icon: "assets/icons/kelas.svg",
              press: () {},
            ),
            KelasMenu(
              text: "Kelas 3",
              icon: "assets/icons/kelas.svg",
              press: () {},
            ),
            KelasMenu(
              text: "Kelas 4",
              icon: "assets/icons/kelas.svg",
              press: () {},
            ),
            KelasMenu(
              text: "Kelas 5",
              icon: "assets/icons/kelas.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
