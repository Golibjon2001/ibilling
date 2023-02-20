import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/images/images.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_userinfo.dart';
import 'package:ibilling/features/profile/pages/widgets/profile_appbar.dart';
import 'package:ibilling/features/profile/pages/widgets/select_language_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: ProfileAppbar(
        text: 'str_profile'.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          children: [
            Container(
              height: 188,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: dark,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage(AppImages.person),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Otabek Abdusamatov",
                              style: TextStyle(
                                  color: lightgreen,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              "str_education",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: white),
                            ).tr(),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    ContractUserinfo(
                      title: 'str_birthdate'.tr(),
                      description: '16.09.2001',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ContractUserinfo(
                      title: 'str_phone'.tr(),
                      description: '+998 97 721 06 88',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ContractUserinfo(
                      title: 'str_email'.tr(),
                      description: 'predatorhunter041@gmail.com',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            InkWell(
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) =>
                      StatefulBuilder(builder: (context, setState) {
                        return SelectDialog(
                       languageName: context.locale.languageCode,
                    );
                  }),
                );
              },
              child: Container(
                height: 44,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: dark, borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.locale.languageCode == 'en'
                            ? "English (USA)"
                            : context.locale.languageCode == 'uz'
                                ? "O'zbek(Lotin)"
                                : "Русский",
                        style: const TextStyle(
                            color: white, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: context.locale.languageCode == 'en'
                                ? const AssetImage(AppImages.flagus)
                                : context.locale.languageCode == 'uz'
                                    ? const AssetImage(AppImages.flaguz)
                                    : const AssetImage(AppImages.flagru),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
