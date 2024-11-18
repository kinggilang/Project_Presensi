import 'package:flutter/material.dart';
import 'package:project_absensi/Provider/state_management.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: provider.history.length,
        itemBuilder: (context, index) {
          var record = provider.history[index];
          return ListTile(
            title: Text('${record.date.toLocal()}'),
            subtitle: Text(
              'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}',
            ),
          );
        },
      ),
    );
  }
}
