import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 360,
            child: CustomDropdown<String>(
              items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"],
              labelText: 'Pilih Kategori',
              canClearSelection: true,
              textAlign: TextAlign.left,
              overlayDirection: DropdownOverlayDirection.above,
              decoration: CustomDropdownDecoration(
                floatingLabelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                floatingLabelGap: 24,
              ),
              onChanged: (value) {
                setState(() {
                  _selected = value;
                });
              },
            ),
          ),
          Text.rich(
            _selected == null
                ? TextSpan(text: "Anda belum memilih kategori")
                : TextSpan(
                    text: "Kategori yang anda pilih: ",
                    children: <TextSpan>[
                      TextSpan(
                        text: _selected.toString(),
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
