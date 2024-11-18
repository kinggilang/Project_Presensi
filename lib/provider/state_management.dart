import 'package:flutter/material.dart';
import 'package:project_absensi/model/riwayat_kehadiran.dart';
import 'package:project_absensi/model/siswa.dart';

class AttendanceProvider extends ChangeNotifier {
  List<Siswa> students = [
    Siswa(name: 'atta'),
    Siswa(name: 'ishak'),
    Siswa(name: 'dapa'),
    Siswa(name: 'reja'),
    Siswa(name: 'alpa'),
    Siswa(name: 'leo'),
    Siswa(name: 'nopal'),
  ];

  List<RiwayatKehadiran> history = [];

  void saveAttendance() {
    int presentCount = students.where((s) => s.isPresent).length;
    int absentCount = students.length - presentCount;

    history.insert(0, RiwayatKehadiran(
      date: DateTime.now(),
      presentCount: presentCount,
      absentCount: absentCount,
    ));

    // Reset kehadiran
    for (var student in students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}
