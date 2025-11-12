import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seller_side/consts/const.dart';
import 'package:seller_side/services/store_services.dart';
import 'package:seller_side/views/product_screen/add_product.dart';
import 'package:seller_side/views/product_screen/product_details.dart';
import 'package:seller_side/views/widgets/appbar_widget.dart';
import 'package:seller_side/views/widgets/loading_indicator.dart';
import 'package:seller_side/views/widgets/text_style.dart';
import 'package:get/get.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      backgroundColor: purpleColor,
      shape: const CircleBorder(),
      onPressed: (){
        Get.to(() => const AddProduct());
      }, 
      child: const Icon(Icons.add, color:white),
      ),
      appBar: appbarWidget(product),
      body: StreamBuilder(
        stream: StoreServices.getProducts(currentUser!.uid),
        
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
           if(!snapshot.hasData){
            return loadingIndicator();
          }else {
            var data = snapshot.data!.docs;

            return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
          children: List.generate(
            data.length,
            (index) => Card(
              child: ListTile(
                  onTap: () {
                    Get.to(() =>  const ProductDetails());
                  },
                leading: Image.asset(imgproduct, width: 100, height: 100, fit: BoxFit.cover),
                title: boldText(text: "${data[index]['p_name']}", color: fontGrey ),
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
      
       );

      }

      },
      ),
      
     
    );


  }
}