import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_yoliday/dashboard/portfolio/portfolios.dart';
import 'package:flutter_test_yoliday/dashboard/portfolio/navBar.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Portfolio',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          actions: [
            SvgPicture.asset(
              'assets/images/shopping.svg',
              width: 20.w,
              height: 20.h,
            ),
            SizedBox(width: 25.w),
            SvgPicture.asset(
              'assets/images/notification.svg',
              width: 20.w,
              height: 20.h,
            ),
            SizedBox(width: 16.w),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.h),
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Project'),
                Tab(text: 'Saved'),
                Tab(text: 'Shared'),
                Tab(text: 'Achievement'),
              ],
              labelStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
              labelColor: Color(0xFFDF5532),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xFFDF5532),
              labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 8.w),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProjectTab(),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class ProjectTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PortfolioSection();
  }
}
