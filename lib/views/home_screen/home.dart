import 'package:get/get.dart';
import 'package:seller_side/consts/const.dart';
import 'package:seller_side/consts/images.dart';
import 'package:seller_side/controllers/home_controller.dart';
import 'package:seller_side/views/home_screen/home_screen.dart';
import 'package:seller_side/views/order_screen/order_sreen.dart';
import 'package:seller_side/views/product_screen/product_screen.dart';
import 'package:seller_side/views/profile_screen/profile_screen.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());

    var navScreens = [
      HomeScreen(), ProductsScreen(),OrdersScreen(), ProfileScreen()];

    var bottomNavbar = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: dashboard),
     BottomNavigationBarItem(icon: Image.asset(icProduct, color: darkGrey, width: 24), label: product),
     BottomNavigationBarItem(icon: Image.asset(icOrders, width: 24, color: darkGrey), label: orders ),
     BottomNavigationBarItem(icon: Image.asset(icGeneralSettings, width: 24, color: darkGrey), label: settings),
  ];


    return Scaffold(
      bottomNavigationBar: Obx(
        () =>  BottomNavigationBar(
        onTap: (index) {
          controller.navIndex.value = index;
        },
        currentIndex: controller.navIndex.value,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: purpleColor,
        unselectedItemColor: darkGrey,
        items: bottomNavbar),
      ),
      body: Obx(
        () =>Column(
        children: [
          Expanded(
            child: navScreens.elementAt(controller.navIndex.value)),
        ]
      ), ),
    );
  }

}