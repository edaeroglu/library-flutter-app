// class CategoryViewModel {
//   late final CategoryService categoryService;
//   List<CategoryModel> categoryList = [];

//   Future<void> getList() async {

//   }
// }
import 'package:flutter/material.dart';
import 'package:mobile_app/feature/home/model/category_model.dart';
import 'package:mobile_app/feature/home/service/category_service.dart';
import 'package:mobile_app/feature/home/view/home_view.dart';
import 'package:mobile_app/product/service/poject_dio.dart';

abstract class HomeViewModel extends State<HomeView> with ProjectDioMixin {
  late final ICategoryService categoryService;

  List<CategoryModel> categoryList = [];

  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    categoryService = CategoryService(service);
    getList();
    // TODO: implement initState
    super.initState();
  }

  Future<void> getList() async {
    changeLoading();
    categoryList = await categoryService.getCategories() ?? [];
    changeLoading();
  }
}
