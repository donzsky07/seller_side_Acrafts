import 'package:get/get.dart';
import 'package:seller_side/consts/const.dart';
import 'package:seller_side/views/message_screen/messages_screen.dart';
import 'package:seller_side/views/profile_screen/edit_profilescreen.dart';
import 'package:seller_side/views/shop_screen/shop_settings_screen.dart';
import 'package:seller_side/views/widgets/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     backgroundColor: purpleColor,
     appBar: AppBar(
      automaticallyImplyLeading: true,
      title: boldText(text: settings, size: 18.0),
      actions: [
        IconButton(onPressed: () {
          Get.to(() => const EditProfileScreen());
        }, 
        icon: const Icon(Icons.edit, color: white)),
        TextButton(onPressed: () {}, child: normalText(text: logout, size: 18.0),)
      ],
     ),
     body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(imgproduct).box.roundedFull.clip(Clip.antiAlias).make(),
            title: boldText(text: "Vendor Name"),
            subtitle: normalText(text: "vendoremail@emart.com"),
          ),
          const Divider(),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(profileButtonsIcons.length, 
              (index) => ListTile(
                onTap: (){
                  switch (index) {
                    case 0:
                    Get.to(() => const ShopSettings());

                    break;
                    case 1:
                    Get.to(() => const MessagesScreen());

                    break;
                    default:

                  }
                },
                leading: Icon(profileButtonsIcons[index], color: white), 
                title: normalText(text: profileButtonsTitles[index],size: 18.0),
              ),),
              ),
             ),

        ],
        ),
      ),



    );





  }
}