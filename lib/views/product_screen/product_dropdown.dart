import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:seller_side/consts/const.dart';
import 'package:seller_side/controllers/products_controller.dart';
import 'package:seller_side/views/widgets/text_style.dart';


Widget productDropdown(hint, List<String> list, dropvalue, ProductsController controller){
  return Obx(
    () => DropdownButtonHideUnderline(
    child: DropdownButton(
      hint: normalText(text: "$hint", color: fontGrey),
      value: dropvalue == '' ? null: dropvalue.value,
      isExpanded: true,
      items: list.map((e) {
        return DropdownMenuItem(
          value: e,
          child: e.toString().text.make(), 
          
        );
      }).toList(),
      onChanged: (newValue) {
        if(hint == "Category"){
          controller.subcategoryvalue.value = '';
          controller.populateSubcategory(newValue.toString());
          }
          dropvalue.value = newValue.toString();
      },
      ),
    ).box.white.padding(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.make()
  );
}