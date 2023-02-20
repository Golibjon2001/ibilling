import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ibilling/assets/colors/colors.dart';
class SingleInfo extends StatelessWidget {
  const SingleInfo({Key? key,required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                StatefulBuilder(
                  builder: (context, setstate) {
                    return AlertDialog(
                      backgroundColor: dark,
                      title: Column(
                        children: [
                          const Text(
                            "Leave a comment, why are you \n      deleting this contract?",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight:
                                FontWeight.w700,
                                color: white),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            width:
                            MediaQuery.of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(
                                  4),
                              color: greydark,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10),
                              child: TextField(
                                maxLines: null,
                                cursorColor: grey,
                                style: const TextStyle(
                                    color: white),
                                decoration:
                                InputDecoration(
                                  border:
                                  InputBorder.none,
                                  hintText:
                                  "str_type".tr(),
                                  hintStyle: const TextStyle(
                                      color: grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(
                                      context);
                                },
                                child: Container(
                                  height: 40,
                                  width: 130,
                                  decoration:
                                  BoxDecoration(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        6),
                                    color: read
                                        .withOpacity(
                                        .15),
                                  ),
                                  child:Center(
                                    child: Text(
                                      "str_cancel".tr(),
                                      style:const TextStyle(
                                          color: read,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap:onTap,
                                child: Container(
                                  height: 40,
                                  width: 130,
                                  decoration:
                                  BoxDecoration(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        6),
                                    color: read,
                                  ),
                                  child:Center(
                                    child: Text(
                                      "str_done".tr(),
                                      style:const TextStyle(
                                          color: white,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ));
      },
      child: Container(
        height: 40,
        width: 164,
        decoration: BoxDecoration(
          color: read.withOpacity(.23),
          borderRadius: BorderRadius.circular(6),
        ),
        child:Center(
          child: Text(
            "str_delete".tr(),
            style: const TextStyle(color: read),
          ),
        ),
      ),
    );
  }
}
