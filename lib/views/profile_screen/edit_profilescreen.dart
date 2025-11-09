import 'package:get/get.dart';
import 'package:seller_side/consts/const.dart';
import 'package:seller_side/views/widgets/custom_textfield.dart';
import 'package:seller_side/views/widgets/text_style.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
      title: boldText(text: editProfile, size: 18.0),
      actions: [
        
        TextButton(onPressed: () {}, child: normalText(text: save, color: white, size: 18.0))
      ],
     ),
     body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column (
        children: [
          Image.asset(
            imgproduct, 
            width: 150,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: white),
              onPressed: (){}, child: normalText(text: changeImage, color: fontGrey),
            ),
            10.heightBox,
            const Divider(color: white),
            customTextField(label: name, hint: "eg. Santurdio Devs"),
            10.heightBox,
            customTextField(label: password, hint: passwordHint), 
            10.heightBox,
            customTextField(label: confirmPass, hint: passwordHint),  

        ],
      ),
      ), 
    );


  }

}