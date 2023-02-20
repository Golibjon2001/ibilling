import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';

class ContractStatus extends StatefulWidget {
  const ContractStatus({Key? key}) : super(key: key);

  @override
  State<ContractStatus> createState() => _ContractStatusState();
}

class _ContractStatusState extends State<ContractStatus> {
  bool one = false;
  bool two = false;
  bool there = false;
  bool four = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        one = !one;
                      });
                    },
                    child: one
                        ? SvgPicture.asset(
                            AppIcons.tickon,
                          )
                        : SvgPicture.asset(
                            AppIcons.tick,
                          )),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "str_paid".tr(),
                  style: TextStyle(color: one ? white : grey),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        two = !two;
                      });
                    },
                    child: two
                        ? SvgPicture.asset(
                            AppIcons.tickon,
                          )
                        : SvgPicture.asset(
                            AppIcons.tick,
                          )),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "str_process".tr(),
                  style: TextStyle(color: two ? white : grey),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        there = !there;
                      });
                    },
                    child: there
                        ? SvgPicture.asset(
                            AppIcons.tickon,
                          )
                        : SvgPicture.asset(
                            AppIcons.tick,
                          )),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "str_rejected".tr(),
                  style: TextStyle(color: there ? white : grey),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        four = !four;
                      });
                    },
                    child: four
                        ? SvgPicture.asset(
                            AppIcons.tickon,
                          )
                        : SvgPicture.asset(
                            AppIcons.tick,
                          )),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "str_payme".tr(),
                  style: TextStyle(color: four ? white : grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
