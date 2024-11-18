import 'package:flutter/material.dart';
import 'package:project_absensi/Provider/state_management.dart';
import 'package:provider/provider.dart';

class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa')),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: provider.students.length,
                  itemBuilder: (context, index) {
                    var student = provider.students[index];
                    return ListTile(
                      title: Text(student.name),
                      trailing: Checkbox(
                        value: student.isPresent,
                        onChanged: (value) {
                          student.isPresent = value!;
                          provider.notifyListeners();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Jarak dari tepi
              child: ElevatedButton(
                onPressed: provider.students.any((s) => s.isPresent)
                    ? () {
                  provider.saveAttendance();
                }
                    : null,
                child: Text('Simpan'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
