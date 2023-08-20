import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/menu_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/more_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/offers_screen/view.dart';
import 'package:meal_monkey/meal_monkey_app/presentation/screens/profile_screen/view.dart';

import '../home_screen/view.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarStates> {
  BottomBarCubit() : super(BottomBarInitial());

  static BottomBarCubit get(context) => BlocProvider.of(context);

  int selectItem = 4;

  change(){
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
   final uid = user!.uid;
   return uid;
  }

  List<String> title = [
    'Menu',
    'Offers',
    'Profile',
    'More',
  ];
  List<IconData> icons = [
    Icons.grid_view_rounded,
    FontAwesomeIcons.bagShopping,
    FontAwesomeIcons.user,
    Icons.read_more_outlined,
  ];



  final pages = [
    const MenuScreen(),
    const OffersScreen(),
    ProfileScreen(

      userId:'' ,
    ),
    const MoreScreen(),
    const HomeScreen(),
  ];

  void changeBottomBar(index) {
    selectItem = index;
    emit(BottomBarChangePage());
  }
}
