import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/images/images.dart';

class SelectDialog extends StatefulWidget {
  final String? languageName;

  const SelectDialog({
    required this.languageName,
    Key? key,
  }) : super(key: key);

  @override
  State<SelectDialog> createState() => _SelectDialogState();
}

class _SelectDialogState extends State<SelectDialog> {
  String? languageName;
  VoidCallback? onPresd;

  @override
  initState() {
    languageName = widget.languageName;
    super.initState();
  }

  selectLanguage() {
    if (languageName == 'uz') {
      context.setLocale(const Locale('uz', 'UZ'));
    } else if (languageName == 'ru') {
      context.setLocale(const Locale('ru', 'RU'));
    } else if (languageName == 'en') {
      context.setLocale(const Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    double size=MediaQuery.of(context).size.width*0.30;
    return AlertDialog(
      backgroundColor: dark,
      content: SizedBox(
        height: 279,
        width: 327,
        child: Column(
          children: [
            Text(
              "str_chooseLanguage".tr(),
              style:const TextStyle(
                  color: white, fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppImages.flaguz),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      "O‘zbek (Lotin)",
                      style:
                          TextStyle(color: white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Radio(
                    value: "uz",
                    activeColor: darkgreen,
                    groupValue: languageName,
                    onChanged: (value) {
                      setState(() {
                        languageName = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppImages.flagru),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      "Русский",
                      style:
                          TextStyle(color: white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Radio(
                    activeColor: darkgreen,
                    value: "ru",
                    groupValue: languageName,
                    onChanged: (value) {
                      setState(() {
                        languageName = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppImages.flagus),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      "English (USA)",
                      style:
                          TextStyle(color: white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Radio(
                    activeColor: darkgreen,
                    value: "en",
                    groupValue: languageName,
                    onChanged: (value) {
                      setState(() {
                        languageName = value;
                      });
                    }),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 37,
                    width:size,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: darkgreen.withOpacity(0.3),
                    ),
                    child:Center(
                      child: Text(
                        "str_cancel".tr(),
                        style:const TextStyle(color: darkgreen),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    selectLanguage();
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 37,
                    width: size,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: darkgreen,
                    ),
                    child:Center(
                      child: Text(
                        "str_done".tr(),
                        style:const TextStyle(color: white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
