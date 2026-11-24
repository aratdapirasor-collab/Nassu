import 'package:flutter/material.dart';
import 'package:lab03_103/participation_model.dart';

class MyParticipationsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Participation'),
        backgroundColor: const Color.fromARGB(255, 8, 109, 163),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildHeaderSection(),
         _buildListSection()],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      color: Colors.blue.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ชื่อผู้ใช้: Aratda pirasor\n'
            'รหัสนิสิต 6720210094',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'กิจกรรมที่ลงทะเบียนทั้งหมด:${mockParticipations.length} รายการ',
            style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }

  Widget _buildListSection() {
    return Expanded(
      child: ListView.builder(
        itemCount: mockParticipations.length,
        itemBuilder: (context, index) {
          final item = mockParticipations[index];
          Color iconColor = Colors.grey;
          IconData statusIcon = Icons.help;
          Color textColor = Colors.black;
          if (item.status == 'Approved') {
            iconColor = Colors.green;
            statusIcon = Icons.check_circle;
          } else if (item.status == 'Pending') {
            iconColor = Colors.greenAccent;
            statusIcon = Icons.access_time_filled;
          } else if (item.status == 'Rejected') {
            iconColor = Colors.pinkAccent;
            statusIcon = Icons.cancel;
            textColor = const Color.fromARGB(255, 98, 179, 220);
          }
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Icon(statusIcon, color: iconColor, size: 40),
              title: Text(
                item.activityName,
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'วันที่เข้าร่วม: ${item.participantDate}\nสถานะ: ${item.status}',
              ),
              isThreeLine: true,
              onTap: () {
                // แสดงปอปอัป SnackBar เมื่อกดที่รายการ
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${item.activityName}\nรายละเอียด: ${item.description}',
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

