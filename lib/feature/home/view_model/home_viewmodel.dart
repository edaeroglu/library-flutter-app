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
  List<ContentModel> contentClassics = [];
  List<ContentModel> contentChildren = [];
  List<ContentModel> contentPhilosophy = [];


  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() async {
    categoryService = CategoryService(service);
    getList();
    await getListContent();
    getListClassics();
    getListChildren();
    getListPhilosophy();
    // TODO: implement initState
    super.initState();
  }

  Future<void> getList() async {
    changeLoading();
    categoryList = await categoryService.getCategories() ?? [];
    changeLoading();
  }

  Future<void> getListContent() async {
    changeLoading();
    contentList = await categoryService.getContentItem() ?? [];
    changeLoading();
  }

  Future<void> getListClassics() async {
    changeLoading();
    contentClassics = await categoryService.getContentClassics() ?? [];
    changeLoading();
  }

  Future<void> getListChildren() async {
    changeLoading();
    contentChildren = await categoryService.getContentChildren() ?? [];
    changeLoading();
  }

  Future<void> getListPhilosophy() async {
    changeLoading();
    contentPhilosophy = await categoryService.getContentPhilosophy() ?? [];
    changeLoading();
  }
}






// class CategoryViewModel {
//   late final CategoryService categoryService;
//   List<CategoryModel> categoryList = [];
//   Future<void> getList() async {
//   }
// }