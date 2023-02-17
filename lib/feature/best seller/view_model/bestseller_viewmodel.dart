import 'package:mobile_app/feature/best%20seller/view/best_seller.dart';
import '../../../product/model/contents_model.dart';
import '../../../product/service/project_dio.dart';
import '../../home/service/category_service.dart';


//  class BestSellerViewModel extends State<BestSellerView>
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

// abstract class BestSellerViewModel extends State<BestSellerView>
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
//   void initState() async {
//     categoryService = CategoryService(service);

//    await getListContent();

//     // TODO: implement initState
//     super.initState();
//   }

//   Future<void> getListContent() async {
//     changeLoading();
//     contentList = await categoryService.getContentItem() ?? [];
//     changeLoading();
//   }
// }
