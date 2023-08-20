import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/strings_manager.dart';
import '../models/more_model/more_model.dart';

List<MoreModel> moreList = [
  MoreModel(
    title: StringsManager.paymentDetails,
    icon:FontAwesomeIcons.handHoldingDollar,
  ),
  MoreModel(
    title: StringsManager.myOrders,
    icon: FontAwesomeIcons.bagShopping,
  ),
  MoreModel(
    title: StringsManager.notifications,
    icon: FontAwesomeIcons.bell,
  ),
  MoreModel(
    title: StringsManager.inbox,
icon: FontAwesomeIcons.envelope,
  ),
  MoreModel(
    title: StringsManager.aboutUs,
   icon: FontAwesomeIcons.info,
  ),
];
