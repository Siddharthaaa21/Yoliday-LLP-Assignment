import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioItem {
  final String title;
  final String subject;
  final String author;
  final String imageUrl;
  final String grade;

  PortfolioItem({
    required this.title,
    required this.subject,
    required this.author,
    required this.imageUrl,
    required this.grade,
  });
}

class PortfolioCard extends StatelessWidget {
  final PortfolioItem item;

  const PortfolioCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          bottomLeft: Radius.circular(15.r),
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.w, 0.h, 12.w, 0.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
Flexible(
  child: ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15.r),
      bottomLeft: Radius.circular(15.r),
    ),
    child: Image.network(
      item.imageUrl,
      fit: BoxFit.fill,
    ),
  ),
),

            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  // SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.subject,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Oleh: ${item.author}',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 25.h,
                        width: 50.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFF39519),
                              Color(0xFFFFCD67),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Center(
                          child: Text(
                            item.grade,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
