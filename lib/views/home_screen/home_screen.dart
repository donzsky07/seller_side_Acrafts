import 'package:seller_side/consts/const.dart';
import 'package:seller_side/consts/images.dart';
import 'package:seller_side/views/widgets/appbar_widget.dart';
import 'package:seller_side/views/widgets/dashboard_button.dart';
import 'package:seller_side/views/widgets/text_style.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(dashboard),
      body: Padding(
        padding: const EdgeInsets.all(8.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context, title: product, count: "60", icon: icProduct),
                dashboardButton(context, title: orders, count: "15", icon: icOrders),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context, title: rating, count: "60", icon: icStar ),
                dashboardButton(context, title: totalSales, count: "15", icon: icOrders),
              ],
            ),
            10.heightBox,
            const Divider(),
            10.heightBox,
            boldText(text: popular, color: fontGrey, size: 16.0),
            20.heightBox,
            ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                3,
                 (index) => ListTile(
                  onTap: () {},
                leading: Image.asset(imgproduct, width: 100, height: 100, fit: BoxFit.cover),
                title: boldText(text: "Product title", color: fontGrey ),
                subtitle: normalText(text: "\$40.0", color: darkGrey),
              ),
              ),
                
        
            ),

          ],
        ),
        ),
    );





  }
}