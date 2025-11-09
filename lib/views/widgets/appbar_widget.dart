import 'package:seller_side/consts/const.dart';
import 'package:seller_side/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;


AppBar appbarWidget(title) {
  return AppBar(
    backgroundColor: white,
        automaticallyImplyLeading: true,
        title: boldText(text: title, color: fontGrey, size: 18.0),
        actions: [
          Center(
            child:  normalText(text: intl.DateFormat('EEE, MMM d,' 'yyy').format(DateTime.now()), 
          color: purpleColor)),
         10.widthBox,
        ],
      );
  

}