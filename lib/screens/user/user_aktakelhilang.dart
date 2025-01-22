import 'package:flutter/material.dart';
import 'package:myapp/screens/user/user_pendaftaran.dart';

class UserAktakelhilang extends StatefulWidget {
  @override
  _UserAktakelhilangState createState() => _UserAktakelhilangState();
}

class _UserAktakelhilangState extends State<UserAktakelhilang> {
  List<RequirementItem> requirements = [
    RequirementItem(text: 'Surat Kehilangan Kepolisian', isChecked: false),
    RequirementItem(text: 'Fotocopy Akta Kelahiran', isChecked: false),
  ];

  bool get areAllChecked {
    return requirements.every((requirement) => requirement.isChecked);
  }

  void toggleCheck(int index, bool? value) {
    setState(() {
      requirements[index].isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akta Kelahiran Hilang'),
        backgroundColor: const Color.fromARGB(255, 139, 32, 24),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Cek Kelengkapan Persyaratan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...requirements.asMap().entries.map((entry) {
              int idx = entry.key;
              RequirementItem requirement = entry.value;
              return Container(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: CheckboxListTile(
                  value: requirement.isChecked,
                  title: Text(requirement.text),
                  onChanged: (value) => toggleCheck(idx, value),
                ),
              );
            }).toList(),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: areAllChecked
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserPendaftaran()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 139, 32, 24),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('Selanjutnya'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RequirementItem {
  String text;
  bool isChecked;

  RequirementItem({required this.text, required this.isChecked});
}
