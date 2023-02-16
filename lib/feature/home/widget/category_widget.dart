import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../product/text_style/text_style.dart';
import '../../best seller/view/best_seller.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Best Seller', style: GeneralTextStyle.CategoryTextStyle),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BestSellerView()));
                },
                child: const Text(
                  'View All',
                  style: TextStyle(color: Color(0xffEF6B4A)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 140.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: 1,
            //itemExtent: 70.0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Card(
                    color: Color(0xffF4F4FF),
                    child: SizedBox(
                      width: 210.w,
                      height: 140.h,
                      child: Row(children: [
                        Image.asset('assets/images/dune.png'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dune',
                                style: GeneralTextStyle.WriterTextStyle),
                            Text(
                              'Frank Herbert',
                              style: GeneralTextStyle.BookTextStyle,
                            ),
                            SizedBox(
                              height: 44.h,
                            ),
                            Text('87,75 ',
                                style: GeneralTextStyle.PriceTextStyle)
                          ],
                        )
                      ]),
                    ),
                  ),
                  Card(
                    color: Color(0xffF4F4FF),
                    child: SizedBox(
                      width: 210.w,
                      height: 140.h,
                      child: Row(children: [
                        Image.asset('assets/images/1984.png'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '1984',
                              style: GeneralTextStyle.WriterTextStyle,
                            ),
                            Text(
                              'George Orwell',
                              style: GeneralTextStyle.BookTextStyle,
                            ),
                            SizedBox(
                              height: 44.h,
                            ),
                            Text(
                              '35,75 ',
                              style: GeneralTextStyle.PriceTextStyle,
                            )
                          ],
                        )
                      ]),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class ClassicsWidget extends StatelessWidget {
  const ClassicsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Classics', style: GeneralTextStyle.CategoryTextStyle),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(color: Color(0xffEF6B4A)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 140.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: 1,
            //itemExtent: 70.0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Card(
                    color: Color(0xffF4F4FF),
                    child: SizedBox(
                      width: 210.w,
                      height: 140.h,
                      child: Row(children: [
                        Image.asset('assets/images/kitap3.png'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('''Romeo ve 
Juliet''', style: GeneralTextStyle.WriterTextStyle),
                            Text(
                              'William Shakespeare',
                              style: GeneralTextStyle.BookTextStyle,
                            ),
                            SizedBox(
                              height: 44.h,
                            ),
                            Text('16,75 ',
                                style: GeneralTextStyle.PriceTextStyle)
                          ],
                        )
                      ]),
                    ),
                  ),
                  Card(
                    color: Color(0xffF4F4FF),
                    child: SizedBox(
                      width: 210.w,
                      height: 140.h,
                      child: Row(children: [
                        Image.asset('assets/images/kitap4.png'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '''Olağanüstü 
Bir Gece''',
                              style: GeneralTextStyle.WriterTextStyle,
                            ),
                            Text(
                              'Stefan Zweig',
                              style: GeneralTextStyle.BookTextStyle,
                            ),
                            SizedBox(
                              height: 44.h,
                            ),
                            Text(
                              '10,00 ',
                              style: GeneralTextStyle.PriceTextStyle,
                            )
                          ],
                        )
                      ]),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class ChildrenWidget extends StatelessWidget {
  const ChildrenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Children', style: GeneralTextStyle.CategoryTextStyle),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(color: Color(0xffEF6B4A)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 140.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: 1,
            //itemExtent: 70.0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Card(
                    color: Color(0xffF4F4FF),
                    child: SizedBox(
                      width: 210.w,
                      height: 140.h,
                      child: Row(children: [
                        Image.asset('assets/images/kitap3.png'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('''Romeo ve 
Juliet''', style: GeneralTextStyle.WriterTextStyle),
                            Text(
                              'William Shakespeare',
                              style: GeneralTextStyle.BookTextStyle,
                            ),
                            SizedBox(
                              height: 44.h,
                            ),
                            Text('16,75 ',
                                style: GeneralTextStyle.PriceTextStyle)
                          ],
                        )
                      ]),
                    ),
                  ),
                  Card(
                    color: Color(0xffF4F4FF),
                    child: SizedBox(
                      width: 210.w,
                      height: 140.h,
                      child: Row(children: [
                        Image.asset('assets/images/kitap4.png'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '''Olağanüstü 
Bir Gece''',
                              style: GeneralTextStyle.WriterTextStyle,
                            ),
                            Text(
                              'Stefan Zweig',
                              style: GeneralTextStyle.BookTextStyle,
                            ),
                            SizedBox(
                              height: 44.h,
                            ),
                            Text(
                              '10,00 ',
                              style: GeneralTextStyle.PriceTextStyle,
                            )
                          ],
                        )
                      ]),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
