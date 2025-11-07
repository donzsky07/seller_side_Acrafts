import 'package:seller_side/consts/const.dart';
import 'package:seller_side/views/widgets/text_style.dart';

Widget ourButton({title, color = purpleColor,onPress}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)),
      backgroundColor: purpleColor,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress, 
    child: normalText(
      text: title, 
      size: 16.0,
      ),
    );
}