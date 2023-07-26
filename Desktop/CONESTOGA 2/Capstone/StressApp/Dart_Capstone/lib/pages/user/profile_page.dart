import 'package:flutter/material.dart';
import 'package:stressed_out/models/user.dart';
import 'package:stressed_out/pages/components/common_components.dart';
import 'package:stressed_out/utils/app_colors.dart';
import 'package:stressed_out/utils/app_constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user = User.empty();

  @override
  void initState() {
    super.initState();

    // TODO: Here you should get user details from Firebase.
    user = User(
        email: 'manikiran@gmail.com',
        username: 'Manikiran',
        gender: 'Male',
        stressLevel: 3,
        stressReports: [
          "Report 1",
          "Report 2",
          "Report 3",
        ],
        imageUrl:
            'https://pub-static.fotor.com/assets/projects/pages/e174890b7d614925a4f275b67873ffb7/300w/fotor-01b0203e5e414695890876d329e551d3.jpg');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonComponents.commonAppBar(context, AppConstants.profile),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(user.imageUrl, scale: 1),
            ),
            const SizedBox(height: 16.0),
            Text(
              user.username ?? '',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primarySwatch.shade900,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              user.email ?? '',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primarySwatch.shade700,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              "Gender: ${user.gender ?? ''}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            Text(
              "Stress Level: ${user.stressLevel ?? ''}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Stress Reports Generated:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: user.stressReports?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.sticky_note_2_outlined),
                    title: Text(user.stressReports![index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
