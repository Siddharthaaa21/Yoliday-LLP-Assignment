import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_test_yoliday/portfoliocard.dart';
import 'portfolioCard.dart';
// import 'package:yoliday_assignment/portfolioitem.dart';
// import 'package:yoliday_assignment/portfolioitem.dart';

class PortfolioSection extends StatefulWidget {
  @override
  _PortfolioSectionState createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  List<PortfolioItem> portfolioItems = [
    PortfolioItem(
      title: 'Title-from-api/database',
      subject: 'Subject-api/db',
      author: 'author-api/db',
      imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      grade: 'A',
    ),PortfolioItem(
      title: 'Title-from-api/database',
      subject: 'Subject-api/db',
      author: 'author-api/db',
      imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      grade: 'A',
    ),PortfolioItem(
      title: 'Title-from-api/database',
      subject: 'Subject-api/db',
      author: 'author-api/db',
      imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      grade: 'A',
    ),PortfolioItem(
      title: 'Title-from-api/database',
      subject: 'Subject-api/db',
      author: 'author-api/db',
      imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      grade: 'A',
    ),PortfolioItem(
      title: 'Title-from-api/database',
      subject: 'Subject-api/db',
      author: 'author-api/db',
      imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      grade: 'A',
    ),PortfolioItem(
      title: 'Title-from-api/database',
      subject: 'Subject-from-api/db',
      author: 'author-api/db',
      imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      grade: 'A',
    ),PortfolioItem(
      title: 'Title-from-api/database',
      subject: 'Subject-from-api/db',
      author: 'author-from-api/db',
      imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      grade: 'A',
    ),
  ];

  List<PortfolioItem> filteredItems = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredItems = portfolioItems;
  }

  void filterItems(String query) {
    setState(() {
      searchQuery = query;
      filteredItems = portfolioItems
          .where(
              (item) => item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: TextField(
                onChanged: filterItems,
                decoration: InputDecoration(
                  hintText: 'Search a project',
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(8.r, 8.r, 7.r, 7.r),
                    child: Container(
                      height: 20.h,
                      width: 22.w,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 19.w,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFDF5532),
                        borderRadius: BorderRadius.circular(13.r),
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        BorderSide(color: Color(0xFFDF5532), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return PortfolioCard(item: filteredItems[index]);
                },
              ),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30.h,
          child: Center(
            child: ElevatedButton.icon(
              onPressed: () {
                // filter functionality
              },
              icon: SvgPicture.asset(
                'assets/images/filter.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              label: Text('Filter'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFDF5532),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
