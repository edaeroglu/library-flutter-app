import 'package:flutter/material.dart';
import 'package:mobile_app/feature/home/model/category_model.dart';
import 'package:mobile_app/feature/home/service/category_service.dart';
import 'package:mobile_app/feature/home/view/home_view.dart';
import 'package:mobile_app/product/service/project_dio.dart';
import '../../../product/model/contents_model.dart';

abstract class HomeViewModel extends State<HomeView> with ProjectDioMixin {
  late final ICategoryService categoryService;

  List<CategoryModel> categoryList = [];
  List<ContentModel> contentList = [];
  List<List<ContentModel>> allContents = [];

  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  //  @override
  // Future<void> initState() async {
  //   super.initState();
  //   await initCategoryService();
  //   getListContent();
  // }

  @override
  void initState() async {
    await getList();

    // TODO: implement initState
    super.initState();
  }

  Future<void> getList() async {
    changeLoading();
    categoryService = CategoryService(service);
    categoryList = await categoryService.getCategories() ?? [];
    await getListContent(categoryList.length);
    changeLoading();
  }

  Future<void> getListContent(int count) async {
    allContents = List.generate(count, (index) => []);
    for (var i = 0; i < count; i++) {
      // allContents.add(getListContent(count) as List<ContentModel>);
      allContents[i] = await categoryService.getContents(i) ?? [];
    }
    allContents.forEach((element) {
      print(element.first.name);
    });
    // contentList = await categoryService.getContents(count) ?? [];
  }
}






// class CategoryViewModel {
//   late final CategoryService categoryService;
//   List<CategoryModel> categoryList = [];
//   Future<void> getList() async {
//   }
// }