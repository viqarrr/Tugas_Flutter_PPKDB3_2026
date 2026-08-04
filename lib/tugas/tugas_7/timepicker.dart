import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePick extends StatefulWidget {
  const TimePick({super.key});

  @override
  State<TimePick> createState() => _TimePickState();
}

class _TimePickState extends State<TimePick> {
  TimeOfDay? _selectedTimeOfDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            "Buat Pengingat Waktu",
            style: TextStyle(
              fontFamily: "Plus Jakarta Sans",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff6C7278),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x24E4E5E7),
                  offset: Offset(0, 2),
                  blurRadius: 2,
                ),
              ],
            ),
            child: TextField(
              onTap: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    _selectedTimeOfDay = picked;
                  });
                }
              },
              readOnly: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.5,
                  horizontal: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0xffedf1f3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0xffedf1f3)),
                ),
                fillColor: Colors.white,
                hintText: _selectedTimeOfDay == null
                    ? "Anda Belum Pilih Jam"
                    : DateFormat("HH:mm", "id_ID").format(
                        DateTime(
                          0,
                          0,
                          0,
                          _selectedTimeOfDay!.hour,
                          _selectedTimeOfDay!.minute,
                        ),
                      ),
                hintStyle: TextStyle(fontSize: 14),
                suffixIcon: Icon(Icons.calendar_month),
              ),
            ),
          ),
          Text(
            _selectedTimeOfDay == null
                ? "Anda Belum Pilih Jam"
                : "Pengingat diatur pukul: ${DateFormat("HH:mm", "id_ID").format(DateTime(0, 0, 0, _selectedTimeOfDay!.hour, _selectedTimeOfDay!.minute))}",
          ),
        ],
      ),
    );
  }
}
