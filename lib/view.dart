import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:translator/translator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textInput = TextEditingController();
  String _outputText = "Hasil....";
  final GoogleTranslator _translator = GoogleTranslator();
  String _selectedLanguage = "en"; // Default: English

  // Daftar bahasa & kode ISO-nya
  final Map<String, String> _languages = {
    "English": "en",
    "Español": "es",
    "Bahasa Indonesia": "id",
    "Hindi": "hi",
    "Russian": "ru",
    "Portuguese": "pt",
  };

  // Fungsi untuk menerjemahkan teks
  void _translateText() async {
    if (_textInput.text.isNotEmpty) {
      final translation = await _translator.translate(
        _textInput.text,
        to: _selectedLanguage,
      );
      setState(() {
        _outputText = translation.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                // Dropdown untuk memilih bahasa tujuan
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    dropdownColor: Colors.grey[900],
                    value: _selectedLanguage,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLanguage = newValue!;
                      });
                    },
                    items: _languages.entries.map((entry) {
                      return DropdownMenuItem<String>(
                        value: entry.value,
                        child: Text(
                          entry.key,
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // Input
                Container(
                  padding: EdgeInsets.only(left: 2.w),
                  width: 90.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _textInput,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 5,
                    cursorColor: Colors.grey.withOpacity(0.5),
                    decoration: InputDecoration(
                      hintText: "Masukkan teks...",
                      hintStyle: TextStyle(
                        color: Colors.white60,
                        fontSize: 16.sp,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: 2.h),

                // Hasil terjemahan
                Container(
                  padding: EdgeInsets.all(2.w),
                  width: 90.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _outputText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 2.h),

                // Tombol Translate
                ElevatedButton(
                  onPressed: _translateText,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade200,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  ),
                  child: Text(
                    "Terjemahkan",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
