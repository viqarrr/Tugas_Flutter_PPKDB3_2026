import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool _isChecked = false;
  String? _selected;
  DateTime? _selectedTime;
  TimeOfDay? _selectedTimeOfDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        // Checkbox
        checkboxWidget(),
        // Switch
        switchWidget(),
        // Dropdown
        dropdownWidget(),
        // Datepicker
        datepickerWidget(context),
        // TimePicker
        ElevatedButton(
          onPressed: () async {
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
          child: Text("Pilih Jam"),
        ),
        Text(
          _selectedTimeOfDay == null
              ? "Anda Belum Pilih Tanggal"
              : _selectedTimeOfDay.toString(),
        ),
        Text(
          _selectedTimeOfDay == null
              ? "Anda Belum Pilih Tanggal"
              : _selectedTimeOfDay!.format(context),
        ),
        Text(
          _selectedTimeOfDay == null
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
        ),
        Text(
          _selectedTimeOfDay == null
              ? "Anda Belum Pilih Jam"
              : DateFormat("hh:mm a", "id_ID").format(
                  DateTime(
                    0,
                    0,
                    0,
                    _selectedTimeOfDay!.hour,
                    _selectedTimeOfDay!.minute,
                  ),
                ),
        ),
      ],
    );
  }

  Column datepickerWidget(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        ElevatedButton(
          onPressed: () async {
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
          child: Text("Pilih Tanggal"),
        ),
        Text(
          _selectedTime == null
              ? "Anda Belum Pilih Tanggal"
              : _selectedTime.toString(),
        ),
        Text(
          _selectedTime == null
              ? "Anda Belum Pilih Tanggal"
              : DateFormat(
                  "EEEE, MMMM dd yyyy",
                  "id_ID",
                ).format(_selectedTime!),
        ),
      ],
    );
  }

  Column dropdownWidget() {
    return Column(
      children: [
        DropdownButton(
          value: _selected,
          items: ["Merah", "Kuning", "Hijau"].map((String val) {
            return DropdownMenuItem(value: val, child: Text(val));
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selected = value;
            });
          },
        ),
        Text(_selected.toString()),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: _selected == "Merah"
                ? Colors.red
                : _selected == "Kuning"
                ? Colors.yellow
                : Colors.green,
          ),
        ),
      ],
    );
  }

  Row switchWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        Switch(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = !_isChecked;
            });
          },
        ),
        Text(_isChecked ? "Checked" : "Unchecked"),
      ],
    );
  }

  Row checkboxWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = !_isChecked;
              _isChecked = value ?? false;
            });
          },
        ),
        Text(_isChecked ? "Checked" : "Unchecked"),
      ],
    );
  }
}
