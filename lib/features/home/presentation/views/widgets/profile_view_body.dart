import 'dart:io';
import 'package:e_commerce_app/core/helper%20functions/get_user.dart';
import 'package:e_commerce_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  var user = getUser();
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String? _savedImagePath;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) return;

      setState(() {
        _image = File(pickedFile.path);
      });

      // حفظ المسار في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image', pickedFile.path);
    } catch (e) {
      debugPrint("❌ Error picking image: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("حصل خطأ أثناء اختيار الصورة")),
      );
    }
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    _savedImagePath = prefs.getString('profile_image');

    if (_savedImagePath != null) {
      setState(() {
        _image = File(_savedImagePath!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title:
            const Text("حسابي", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ---- Profile Header ----
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : const NetworkImage("https://via.placeholder.com/150")
                            as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt,
                            color: Colors.white, size: 18),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              // الاسم والايميل
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(user.email, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          const Divider(),

          _buildListTile("الملف الشخصي", Icons.person, () {}),
          _buildListTile("طلباتي", Icons.local_shipping, () {}),
          _buildListTile("المدفوعات", Icons.lock, () {}),
          _buildListTile("المفضلة", Icons.favorite_border, () {}),

          SwitchListTile(
            value: true,
            onChanged: (val) {},
            secondary:
                const Icon(Icons.notifications_none, color: Colors.green),
            title: const Text("الإشعارات"),
          ),

          _buildListTile("اللغة", Icons.language, () {}),
          SwitchListTile(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (val) {
              final fruitHubState =
                  context.findAncestorStateOfType<FruitHubState>();
              setState(() {
                fruitHubState?.toggleTheme(val);
              });
            },
            secondary: const Icon(Icons.dark_mode, color: Colors.green),
            title: const Text("الوضع الليلي"),
          ),

          const Divider(),
          const Text("المساعدة", style: TextStyle(fontWeight: FontWeight.bold)),

          _buildListTile("من نحن", Icons.info_outline, () {}),

          const SizedBox(height: 30),

          // ---- Logout ----
          ElevatedButton.icon(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  'login', (Route<dynamic> route) => false);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade50,
              foregroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            icon: const Icon(Icons.logout),
            label: const Text("تسجيل الخروج"),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      trailing: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
