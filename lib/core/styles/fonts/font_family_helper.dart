class FontFamilyHelper {
  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';

static String getlocalizedFontFamily() {
  // ignore: prefer_const_declarations
  final  currentlanguage = 'ar';
  if (currentlanguage == 'ar') {
    return cairoArabic;
  } else {
    return  poppinsEnglish;
  }
}

}