import 'package:get/get.dart';
import 'package:shopping/model/products_model.dart';
import 'package:shopping/services/product_services.dart';


class HomeController extends GetxController {
  var categoryItems = List<String>.empty().obs;
  var itemItems = List<productsModel>.empty().obs;
  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchItems();
  }

  void fetchCategories() async {
    var getItems = [
      "electronics",
      "jewelery",
      "men's clothing",
      "women's clothing"
    ];
    categoryItems.value = getItems;
  }

  Future<void> fetchItems() async {
    loading.value = true;
    itemItems.clear();
    var getItems = await ProductServices.fetchItems();
    loading.value = false;
    if (getItems != null)
      getItems.forEach((item) {
        itemItems.add(productsModel.fromJson(item));
      });
  }

  productsModel getDetails(int index){
    return itemItems[index];
  }
}
