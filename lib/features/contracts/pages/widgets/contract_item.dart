
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';
import 'package:ibilling/features/contracts/data/models/contract_model.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_userinfo.dart';
import 'package:jiffy/jiffy.dart';

class ContractItem extends StatelessWidget {
  ContractItem({Key? key, required this.user, required this.index})
      : super(key: key);
  final List user;
  final int index;

  @override
  Widget build(BuildContext context,) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
          ),
          height: 148,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: dark,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.paper),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "№ 153",
                          style: TextStyle(color: white),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:user[index].color.withOpacity(.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 2, bottom: 2),
                        child: Text(
                          user[index].text,
                          style: TextStyle(color:user[index].color),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                ContractUserinfo(
                  title: 'Fish:',
                  description: user[index].name,
                ),
                const SizedBox(
                  height: 5,
                ),
                ContractUserinfo(
                  title: 'str_amount'.tr(),
                  description: user[index].salary,
                ),
                const SizedBox(
                  height: 5,
                ),
                ContractUserinfo(
                  title: 'str_last-invoice'.tr(),
                  description: user[index].invoise,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "str_number".tr(),
                          style: const TextStyle(
                              color: white, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(user[index].number.toString(),
                            style: const TextStyle(
                              color: grey,
                            )),
                      ],
                    ),
                    Text(Jiffy(user[index].date).format('dd.MM.yyyy'),
                        style: const TextStyle(color: grey)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
