import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../profile/profile_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Sistem Sekolah",
            style: TextStyle(
              fontSize: 32,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          // Ganti dengan foto profil
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/images/fajar.png'),
          ),
        ],
      ),
    );
  }
}
