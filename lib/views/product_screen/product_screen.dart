import 'package:seller_side/consts/const.dart';
import 'package:seller_side/consts/images.dart';
import 'package:seller_side/views/widgets/appbar_widget.dart';
import 'package:seller_side/views/widgets/text_style.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      backgroundColor: purpleColor,
      shape: const CircleBorder(),
      onPressed: (){}, 
      child: const Icon(Icons.add, color:white),
      ),
      appBar: appbarWidget(product),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
          children: List.generate(
            20,
            (index) => Card(
              child: ListTile(
                  onTap: () {},
                leading: Image.asset(imgproduct, width: 100, height: 100, fit: BoxFit.cover),
                title: boldText(text: "Product title", color: fontGrey ),
                subtitle: normalText(text: "\$40.0", color: darkGrey),
                trailing: VxPopupMenu(
                  arrowSize: 0.0,
                  menuBuilder: () => Column(
                    children: List.generate(
                      popupMenuTitles.length, 
                      (index) => Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                      children: [
                        Icon(popupMenuIcons[index]),
                        10.widthBox,
                        normalText(text: popupMenuTitles[index], color: darkGrey )
                      ],    
                  ).onTap (() {}),
                  ),
                  ),
                ).box.white.rounded.width(200).make(), 
                clickType: VxClickType.singleClick,
                child: Icon(Icons.more_vert_rounded)),

            ),

          ),
          
          ),
        )
        ),
      
    )
    );

 



  }
}