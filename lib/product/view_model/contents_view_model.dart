// import 'package:flutter/material.dart';
// import 'package:mobile_app/feature/best%20seller/view/best_seller.dart';
// import 'package:mobile_app/product/model/contents_model.dart';

// import '../../feature/home/view/home_view.dart';

// import '../service/contents_service.dart';
// import '../service/project_dio.dart';

// abstract class ContentViewModel extends State<BestSellerView> with ProjectDioMixin {
//   late final IContentService contentService;

//   List<ContentModel> contentList = [];

//   bool isLoading = false;

//   void changeLoading() {
//     setState(() {
//       isLoading = !isLoading;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     contentService = ContentService(service);
//     getList();
//     // TODO: implement initState
    
//   }

//   Future<void> getList() async {
//     changeLoading();
//     contentList = await contentService.getContentItem() ?? [];
//     changeLoading();
//   }
// }
