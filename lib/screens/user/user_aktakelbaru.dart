import 'package:flutter/material.dart';
import 'package:myapp/screens/user/user_pendaftaran.dart';

class UserAktakelbaru extends StatefulWidget {
  @override
  _UserAktakelbaruState createState() => _UserAktakelbaruState();
}

class _UserAktakelbaruState extends State<UserAktakelbaru> {
  List<RequirementItem> requirements = [
    RequirementItem(text: 'KK Lama', isChecked: false),
    RequirementItem(text: 'KTP Orang Tua', isChecked: false),
    RequirementItem(text: 'Buku Nikah', isChecked: false),
    RequirementItem(text: 'Fotocopy KTP 2 Saksi', isChecked: false),
    RequirementItem(text: 'Surat Keterangan Lahir', isChecked: false),
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
        title: Text('Akta Kelahiran Baru'),
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
