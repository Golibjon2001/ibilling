import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';
import 'package:ibilling/features/contracts/data/models/contract_model.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_list.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_userinfo.dart';
import 'package:ibilling/features/create/pages/create_screen.dart';
import 'package:ibilling/features/single/pages/widgets/singel_info.dart';
import 'package:ibilling/features/single/pages/widgets/single_appbar.dart';
import 'package:jiffy/jiffy.dart';

class ContractsSingle extends StatefulWidget {
  static const String id="single";
  final ContractModel? model;
  const ContractsSingle({Key? key,   this.model,}) : super(key: key);

  @override
  State<ContractsSingle> createState() => _ContractsSingleState();
}

class _ContractsSingleState extends State<ContractsSingle> {
  final List items = item;
  List<bool> itemshow = [];

  @override
  void initState() {
    super.initState();

    if(widget.model != null){
      items.add(widget.model);
    }

    itemshow = List.filled(items.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: const SingleAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return itemOf(items[index],index);
            }),
      ),
    );
  }

  Widget itemOf(ContractModel contractModel, int index) {
    return InkWell(
      onTap: () {
        if (itemshow[index]) {
          itemshow[index] = false;
        } else {
          itemshow[index] = true;
          for (int k = 0; k < itemshow.length; k++) {
            if (k == index) {
              continue;
            } else {
              itemshow[k] = false;
            }
          }
        }
        setState(() {});
      },
      child: SizedBox(
        height: itemshow[index] ? 380 : 155,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: dark,
                borderRadius: BorderRadius.circular(6),
              ),
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
                          color: contractModel.color.withOpacity(.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 2, bottom: 2),
                          child: Text(
                            contractModel.text,
                            style: TextStyle(color: contractModel.color),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ContractUserinfo(
                    title: "str_fish".tr(),
                    description: contractModel.name,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ContractUserinfo(
                    title: "str_amount".tr(),
                    description: contractModel.salary,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ContractUserinfo(
                    title: "str_last-invoice".tr(),
                    description: contractModel.invoise,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "str_number".tr(),
                            style:const TextStyle(
                                color: white, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(contractModel.number.toString(),
                              style: const TextStyle(
                                color: grey,
                              )),
                        ],
                      ),
                      Text(Jiffy(contractModel.date).format('dd.MM.yyyy'),
                          style: const TextStyle(color: grey)),
                    ],
                  ),
                  itemshow[index]
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            const SizedBox(
                              height: 5,
                            ),
                            ContractUserinfo(
                              title: "str_organization".tr(),
                              description:
                                  "Проспект Мирзо-Улугбек, дом 58, Мирзо-Улугбекский район, Ташкент",
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ContractUserinfo(
                              title: "str_ITN/IEC".tr(),
                              description: '5647520318',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ContractUserinfo(
                              title: "str_createAt".tr(),
                              description: '14:38, 2 February, 2021',
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            itemshow[index]
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SingleInfo(onTap: () {setState(() {items.removeAt(index);
                            Navigator.pop(context);});
                          },),
                          const SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           CreateScreen(items.length,),
                                  )
                              ).then((value) {
                                if(value==null){
                                }else{
                                  final model=value as ContractModel;
                                  items.add(model);
                                  setState(() {});
                                 itemshow =  List.filled(items.length, false);
                                }
                                setState(() {});
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 164,
                              decoration: BoxDecoration(
                                color: darkgreen,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child:Center(
                                child: Text(
                                  "str_createContract".tr(),
                                  style:const TextStyle(color: white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Other contracts with\nYuldasheva Feruza",
                        style: TextStyle(
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
