import 'package:seller_side/consts/const.dart';
import 'package:get/get.dart';
import 'package:seller_side/views/widgets/custom_textfield.dart';
import 'package:seller_side/views/widgets/text_style.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
         leading: IconButton(onPressed: (){
          Get.back();
        },
        icon: Icon(Icons.arrow_back, color: white )),
        title: boldText(text: "Add Product", size: 18.0),
        actions: [
          TextButton(onPressed: (){}, child: boldText(text: save, color: white, size: 18.0)),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextField(
              hint: "eg. BMW ",
              label: "Product name", 
            ),
            
          ],
        ),
        ),
    );
  

  }
}