// import '../../../product/model/contents_model.dart';
// import '../../../product/service/project_dio.dart';
// import '../../home/service/category_service.dart';
// import '../view/book_details_view.dart';

// abstract class BookDetailsViewModel extends State<BookDetailsView>
//     with ProjectDioMixin {
//   late final ICategoryService categoryService;

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
//     initCategoryService();
//     getListContent();
//   }

//   Future<void> initCategoryService() async {
//     categoryService = CategoryService(service);
//   }

//   Future<void> getListContent() async {
//     changeLoading();
//     contentList = await categoryService.getContentItem() ?? [];
//     changeLoading();
//   }
// }