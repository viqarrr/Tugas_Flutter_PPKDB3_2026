import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePick extends StatefulWidget {
  const DatePick({super.key});

  @override
  State<DatePick> createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  DateTime? _selectedTime;

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
            "Pilih Tanggal Lahir Anda",
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
            child: Material(
              child: TextField(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(-2500),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedTime = picked;
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
                  hintText: _selectedTime == null
                      ? "Anda Belum Pilih Tanggal"
                      : DateFormat("dd/MM/yyyy").format(_selectedTime!),
                  hintStyle: TextStyle(fontSize: 14),
                  suffixIcon: Icon(Icons.calendar_month),
                ),
              ),
            ),
          ),
          Text(
            _selectedTime == null
                ? "Anda Belum Pilih Tanggal"
                : "Tanggal lahir: ${DateFormat("EEEE, MMMM dd yyyy", "id_ID").format(_selectedTime!)}",
          ),
        ],
      ),
    );
  }
}
