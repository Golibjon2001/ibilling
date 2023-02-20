import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/features/contracts/data/models/contract_model.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_list.dart';
import 'package:ibilling/features/create/pages/widgets/create_info.dart';
import 'package:ibilling/features/create/pages/widgets/create_infoown.dart';
import 'package:ibilling/features/profile/pages/widgets/profile_appbar.dart';

class CreateScreen extends StatefulWidget {
  int len = 0;

  CreateScreen(int length, {super.key}) {
    len = length;
  }

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  final List items = item;
  bool icon = false;
  final itms = ['str_Physical'.tr(), 'str_Legal'.tr()];
  final itm = ['str_paid'.tr(), 'str_process'.tr(), 'str_rejected'.tr(), 'str_payme'.tr()];
  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: ProfileAppbar(
        text: "str_newContract".tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreatInfo(
                text: "str_face".tr(),
                itms: itms,
              ),
              const SizedBox(
                height: 16,
              ),
              CreateInfoown(
                text: "str_fullName".tr(),
                icon: icon ? Icons.help : null,
                controller: _name,
              ),
              const SizedBox(
                height: 16,
              ),
              CreateInfoown(
                text: "str_Address".tr(),
                icon: icon ? Icons.help : null,
                controller: null,
              ),
              const SizedBox(
                height: 16,
              ),
              CreateInfoown(
                text: "str_TIN".tr(),
                icon: icon ? null : Icons.help,
                controller: null,
              ),
              const SizedBox(
                height: 16,
              ),
              CreatInfo(
                text: "str_statusContract".tr(),
                itms: itm,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  ContractModel contract = ContractModel(
                      name: _name.text,
                      id: 1,
                      salary: "1200 USD",
                      number: 1,
                      invoise: "26",
                      date: DateTime.now(),
                      color: orange,
                      text: "In process");
                  Navigator.pop(context, contract);
                },
                child: Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: darkgreen,
                  ),
                  child:Center(
                    child: Text(
                      "str_saveContract".tr(),
                      style:const TextStyle(
                          color: white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
