import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nx/models/entities/icon_status.dart';
import 'package:nx/ui/components/behavior_custom.dart';
import 'package:nx/ui/pages/home/home_page.dart';
import 'dart:math' as math;
import 'bottombar_cubit.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  late BottomBarCubit _cubit;
  late PageController _pageController;

  @override
  void initState() {
    _cubit = BottomBarCubit();
    _pageController = PageController(initialPage: 0, keepPage: true);
    super.initState();
  }

  void onChangePage(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<BottomBarCubit, BottomBarState>(
        bloc: _cubit,
        buildWhen: (prev, current) => prev.currentIndex != current.currentIndex,
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xFFb9a381),
            body: _buildPageView(),
            bottomNavigationBar: _buildBottomNavigationBar(state.currentIndex),
          );
        },
      ),
    );
  }

  Widget _buildPageView() {
    return ScrollConfiguration(
      behavior: BehaviorCustom(),
      child: PageView(
        physics: const ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (value) {
          _cubit.changePage(value);
          onChangePage(value);
        },
        children: [
          const HomePage(),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(int currentTabIndex) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        currentIndex: currentTabIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          _buildItem(iconBottomBars[0]),
          _buildItem(iconBottomBars[1]),
          _buildItem(iconBottomBars[2]),
          _buildItem(iconBottomBars[3]),
          _buildItem(iconBottomBars[4]),
        ],
        onTap: (int index) {
          _cubit.changePage(index);
          onChangePage(index);
        },
      ),
    );
  }

  BottomNavigationBarItem _buildItem(IconStatus icon) {
    return BottomNavigationBarItem(
      icon: Container(
        height: 40,
        padding: const EdgeInsets.only(
          bottom: 3,
          top: 10,
        ),
        child: Icon(
          icon.inactive,
          color: Colors.grey,
        ),
      ),
      label: '',
      activeIcon: SizedBox(
        height: 28,
        width: 28,
        child: Stack(
          children: [
            Transform.rotate(
              angle: -math.pi / 4,
              child: Container(
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.3, top: 1),
              child: Icon(
                icon.active,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static List<IconStatus> iconBottomBars = [
    IconStatus(active: Icons.home, inactive: Icons.home),
    IconStatus(active: Icons.card_travel, inactive: Icons.card_travel),
    IconStatus(active: Icons.messenger_outline_rounded, inactive: Icons.messenger_outline_rounded),
    IconStatus(active: Icons.notifications, inactive: Icons.notifications),
    IconStatus(active: Icons.account_circle_outlined, inactive: Icons.account_circle_outlined),
  ];
}
