import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shopping/model/products_model.dart';


class CartController extends GetxController {

  var items = List<productsModel>.empty().obs;

  @override
  void onInit() {
    getItems();
    super.onInit();
  }

  double get totalPrice =>
      items.fold(0, (total, currentProduct) => total + currentProduct.price);


  addToCart(productsModel itemModel) async{
    items.add(itemModel);
    var box = await Hive.openBox("cart");
    box.put("cart_items", items.toList());
    Get.showSnackbar(
      GetBar(
        title: "Product added to cart",
        message: "successfully",
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future getItems() async {
    Box box;
    try {
      box = Hive.box('cart');
    } catch (error) {
      box = await Hive.openBox('cart');
      print(error);
    }
    var items = box.get('cart_items');
    if (items != null) this.items.value = items;
  }

  Future<List<productsModel>> getListItems() async {
    Box box;
    try {
      box = Hive.box('cart');
    } catch (error) {
      box = await Hive.openBox('cart');
      print(error);
    }
    var items = box.get('cart_items');
    return items as List<productsModel>;
  }

  clearTodos() {
    try {
      Hive.deleteBoxFromDisk('cart_items');
    } catch (error) {
      print(error);
    }
    items.value = [];
  }

  deleteItem(productsModel item) async {
    items.remove(item);
    var box = await Hive.openBox('cart');
    box.put('cart_items', items.toList());
  }
}