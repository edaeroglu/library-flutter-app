// import 'package:flutter/material.dart';
// import 'package:mobile_app/feature/best%20seller/view/best_seller.dart';
// import 'package:mobile_app/product/service/project_dio.dart';

// import '../../../product/model/contents_model.dart';
// import '../../home/model/category_model.dart';
// import '../../home/service/category_service.dart';

// abstract class BestSellerViewModel extends State<BestSellerView> with ProjectDioMixin {
//   late final ICategoryService categoryService;

//   List<CategoryModel> categoryList = [];
//   List<ContentModel> contentList = [];
//   List<List<ContentModel>> allContents = [];
//   List<ContentModel> productImage = [];

//   bool isLoading = false;

//   void changeLoading() {
//     setState(() {
//       isLoading = !isLoading;
//     });
//   }

//   //  @override
//   // Future<void> initState() async {
//   //   super.initState();
//   //   await initCategoryService();
//   //   getListContent();
//   // }

//   @override
//   void initState() async {
//     await getList();
//     getListProduct();
//     // TODO: implement initState
//     super.initState();
//   }

//   Future<void> getList() async {
//     changeLoading();
//     categoryService = CategoryService(service);
//     categoryList = await categoryService.getCategories() ?? [];
//     await getListContent(categoryList.length);
//     changeLoading();
//   }

//   Future<void> getListContent(int count) async {
//     allContents = List.generate(count, (index) => []);
//     for (var i = 0; i < count; i++) {
//       // allContents.add(getListContent(count) as List<ContentModel>);
//       allContents[i] = await categoryService.getContents(i) ?? [];
//     }
//     allContents.forEach((element) {
//       print(element.first.name);
//     });
//     // contentList = await categoryService.getContents(count) ?? [];
//   }

//   Future<List<ContentModel>> getListProduct() async {
//     productImage = await categoryService.getContents(0) ?? [];

//     await Future.forEach(productImage, (element) async {
//       element.cover =
//           await categoryService.getProductImage(cover: element.cover ?? "");
//       productImage.firstWhere((element2) => element.id == element2.id).cover =
//           element.cover;
//     });
//     return productImage;
//   }
// }

// //  class BestSellerViewModel extends State<BestSellerView>
// //     with ProjectDioMixin {
// //   late final ICategoryService categoryService;

// //   List<ContentModel> contentList = [];
// //   bool isLoading = false;

// //   void changeLoading() {
// //     setState(() {
// //       isLoading = !isLoading;
// //     });
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     initCategoryService();
// //     getListContent();
// //   }

// //   Future<void> initCategoryService() async {
// //     categoryService = CategoryService(service);
// //   }

// //   Future<void> getListContent() async {
// //     changeLoading();
// //     contentList = await categoryService.getContentItem() ?? [];
// //     changeLoading();
// //   }
// // }

// // abstract class BestSellerViewModel extends State<BestSellerView>
// //     with ProjectDioMixin {
// //   late final ICategoryService categoryService;

// //   List<ContentModel> contentList = [];
// //   bool isLoading = false;

// //   void changeLoading() {
// //     setState(() {
// //       isLoading = !isLoading;
// //     });
// //   }

// //   @override
// //   void initState() async {
// //     categoryService = CategoryService(service);

// //    await getListContent();

// //     // TODO: implement initState
// //     super.initState();
// //   }

// //   Future<void> getListContent() async {
// //     changeLoading();
// //     contentList = await categoryService.getContentItem() ?? [];
// //     changeLoading();
// //   }
// // }
