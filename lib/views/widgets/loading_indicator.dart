import 'package:seller_side/consts/const.dart';

Widget loadingIndicator({circleColor = purpleColor}) {
  return  Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(circleColor),
    ),
  );
}

/*Widget loadingIndicator() {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(purpleColor),
  );

}*/