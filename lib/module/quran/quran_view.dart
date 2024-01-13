import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/module/quran/quran_details_view.dart';
import 'package:islami/module/quran/widgets/quran_item.dart';

class QuranView extends StatelessWidget {
  final List<String> suraNames = const [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return Column(
      children: [
        Image.asset(
          'assets/images/quran_header.png',
          width: mediaQuery.width/2,
          height: mediaQuery.height/3.8,
          fit: BoxFit.cover,
        ),
        SizedBox(height: mediaQuery.height * 0.01),
        const Divider(
          indent: 10,
          endIndent: 10,
          height: 0,
          thickness: 2,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                locale.suraNumber,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 2,
              height: mediaQuery.height * 0.056,
              color: theme.colorScheme.onSecondary,
            ),
            Expanded(
              child: Text(
                locale.suraName,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
          height: 0,
          thickness: 2,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  QuranDetailsView.routeName,
                  arguments: SuraData(
                    suraNumber: '${index + 1}',
                    suraName: suraNames[index],
                  ),
                );
              },
              child: QuranItem(
                suraNumber: '${index + 1}',
                suraName: suraNames[index],
              ),
            ),
            itemCount: 114,
          ),
        ),
      ],
    );
  }
}

class SuraData {
  final String suraName;
  final String suraNumber;

  const SuraData({required this.suraNumber, required this.suraName});
}
