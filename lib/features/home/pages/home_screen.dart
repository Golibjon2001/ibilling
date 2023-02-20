import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';
import 'package:ibilling/features/contracts/pages/contracts_screen.dart';
import 'package:ibilling/features/create/pages/widgets/create_dialog.dart';
import 'package:ibilling/features/history/pages/history_screen.dart';
import 'package:ibilling/features/profile/pages/profile.dart';
import 'package:ibilling/features/saved/pages/saved.dart';

class HomeScreen extends StatefulWidget {
  static const String id="hompage";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? _pageController;
  int _currenTab=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:PageView(
         physics: const NeverScrollableScrollPhysics(),
         controller:_pageController,
         children:const[
           ContractsScreen(),
           HistoryScreen(),
           CreateDialog(),
           SavedScreen(),
           ProfileScreen(),
         ],
         onPageChanged:(int index){
           setState(() {
             _currenTab=index;
           });
         },
       ),
      bottomNavigationBar:CupertinoTabBar(
        backgroundColor:darkets,
        onTap:(int index){
          setState(() {
            _currenTab=index;
            _pageController!.animateToPage(index,duration:const Duration(milliseconds:200),curve:Curves.easeIn);
          });
        },
        currentIndex:_currenTab,
        activeColor:white,
        items:[
          BottomNavigationBarItem(
            activeIcon:SvgPicture.asset(AppIcons.documentactiv),
            icon:SvgPicture.asset(AppIcons.document),
            label:"str_contracts".tr(),
          ),
          BottomNavigationBarItem(
            activeIcon:SvgPicture.asset(AppIcons.timecircleactiv),
            icon:SvgPicture.asset(AppIcons.time),
            label:"str_history".tr(),
          ),
          BottomNavigationBarItem(
            activeIcon:SvgPicture.asset(AppIcons.plusactiv),
            icon:SvgPicture.asset(AppIcons.plus),
            label:"str_new".tr(),
          ),
          BottomNavigationBarItem(
            activeIcon:SvgPicture.asset(AppIcons.bookmarkactiv),
            icon:SvgPicture.asset(AppIcons.booc),
            label:"str_saved".tr(),
          ),
          BottomNavigationBarItem(
            activeIcon:SvgPicture.asset(AppIcons.profileactiv),
            icon:SvgPicture.asset(AppIcons.profile),
            label:"str_profile".tr(),
          ),
        ],
      ),
    );
  }
}
