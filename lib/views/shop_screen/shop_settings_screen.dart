import 'package:get/get.dart';
import 'package:seller_side/consts/const.dart';
import 'package:seller_side/views/widgets/custom_textfield.dart';
import 'package:seller_side/views/widgets/text_style.dart';

class ShopSettings extends StatelessWidget {
  const ShopSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
       appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        },
        icon: Icon(Icons.arrow_back, color: white),
      ),
      title: boldText(text: shopSettings, size: 18.0),
      actions: [
        
        TextButton(onPressed: () {}, child: normalText(text: save, color: white, size:18.0))
      ],
     ),
     body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          customTextField(
            label: shopName, 
            hint: nameHint,
          ),
          10.heightBox,
          customTextField(
            label: address, 
            hint: shopAddressHint,
          ),
          10.heightBox,
          customTextField(
            label: mobile, 
            hint: shopMobileHint,
          ),
          10.heightBox,
          customTextField(
            label: website, 
            hint: shopWebsiteHint,
          ),
          10.heightBox,
          customTextField(
            isDesc: true,
            label: description,
            hint: shopDescHint,
          ),
          

        ],
      ),
      ),

    );
     


  }
}