import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/product/text_style/text_style.dart';
import 'package:mobile_app/product/textformfield/text_form_field.dart';
import '../../../product/model/contents_model.dart';
import '../../../product/padding/padding.dart';
import '../../book details/view/book_details_view.dart';

class BestSellerView extends StatefulWidget {
  BestSellerView({
    super.key,
    required this.contentList,
    required this.title,
    required this.token,
  });
  final List<ContentModel> contentList;
  final String token;
  String title;

  @override
  State<BestSellerView> createState() => _BestSellerViewState();
}

class _BestSellerViewState extends State<BestSellerView> {
  late final List<ContentModel> contentList;

  @override
  void initState() {
    contentList = widget.contentList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 92.h,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xff090937)),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        actions: [
          Padding(
            padding: BestSellerPadding().categoryPadding,
            child: Center(
                child: Text(
              widget.title,
              style: GeneralTextStyle.accountTextStyle,
            )),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            SearchBox().searchBoxDesign,
            Expanded(
              child: Padding(
                padding: GridViewPadding().gridViewPadding,
                child: GridView.builder(
                    gridDelegate: Grid().style,
                    itemCount: contentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookDetailsView(
                                        token: widget.token,
                                        content: contentList[index],
                                      )));
                        },
                        child: Card(
                          elevation: 0,
                          color: const Color(0xffF4F4FF),
                          child: Column(
                            children: [
                              Image.network(
                                contentList[index].cover ?? "",
                                width: 150.w,
                                height: 225.h,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: CardPadding().cardPadding,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  contentList[index].name ?? "",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GeneralTextStyle
                                                      .bookTextStyle
                                                      .copyWith(
                                                    color: Color(0xff090937),
                                                  )),
                                            ),
                                            Expanded(
                                              child: Text(
                                                  contentList[index].author ??
                                                      "",
                                                  style: GeneralTextStyle
                                                      .bookTextStyle
                                                      .copyWith(
                                                    fontSize: 8.sp,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            contentList[index]
                                                    .price
                                                    .toString() ??
                                                "",
                                            style: GeneralTextStyle
                                                .priceBSTextStyle,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Grid {
  final style = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10);
}
