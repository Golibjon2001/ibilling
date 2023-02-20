import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/features/create/pages/widgets/create_info.dart';
import 'package:ibilling/features/create/pages/widgets/create_infoown.dart';
import 'package:ibilling/features/profile/pages/widgets/profile_appbar.dart';

class CreateInvoice extends StatefulWidget {
  const CreateInvoice({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateInvoice> createState() => _CreateInvoiceState();
}

class _CreateInvoiceState extends State<CreateInvoice> {
  final itms = ["str_status".tr()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:ProfileAppbar(
        text: 'str_newInvoice'.tr(),
      ),
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          children: [
            CreateInfoown(
              text: 'str_serviceName'.tr(),
              icon: null,
              controller: null,
            ),
            const SizedBox(
              height: 16,
            ),
            CreateInfoown(
              text: 'str_invoiceAmount'.tr(),
              icon: null,
              controller: null,
            ),
            const SizedBox(
              height: 16,
            ),
            CreatInfo(
              text: 'str_invoiceStatus'.tr(),
              itms: itms,
            ),
          ],
        ),
      ),
    );
  }
}
