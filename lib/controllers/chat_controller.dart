import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:seller_side/consts/const.dart';
import 'package:seller_side/controllers/home_controller.dart';

class ChatController extends GetxController {
  @override
  void onInit() {
    getChatId();
    super.onInit();
  }

  // Firestore reference
  var chats = FirebaseFirestore.instance.collection("chats");

  // Arguments coming from chat list or product screen
  var friendName = Get.arguments[0];   // user name
  var friendId = Get.arguments[1];     // user id

  // Seller info
  var sellerName = Get.find<HomeController>().username;
  var sellerId = currentUser!.uid;

  var msgController = TextEditingController();

  dynamic chatDocId;

  var isloading = false.obs;

  getChatId() async {
    isloading(true);

    // Step 1: find any chat where SELLER is a member
    var query = await chats
        .where("users", arrayContains: sellerId)
        .get();

    // Step 2: check if any chat contains THIS user (friend)
    if (query.docs.isNotEmpty) {
      for (var doc in query.docs) {
        List users = doc["users"];
        if (users.contains(friendId)) {
          chatDocId = doc.id;
          isloading(false);
          return;
        }
      }
    }

    // Step 3: No chat found → Create a new one
    var newChat = await chats.add({
      "created_on": FieldValue.serverTimestamp(),
      "last_msg": "",
      "users": [sellerId, friendId],   // VERY IMPORTANT!!!
      "fromId": "",
      "toId": "",
      "sender_name": sellerName,
      "friend_name": friendName,
    });

    chatDocId = newChat.id;

    isloading(false);
  }

  sendMsg(String msg) async {
    if (msg.trim().isNotEmpty) {
      // update parent chat document
      chats.doc(chatDocId).update({
        "created_on": FieldValue.serverTimestamp(),
        "last_msg": msg,
        "fromId": sellerId,
        "toId": friendId,
      });

      // add message to subcollection
      chats.doc(chatDocId).collection("messages").add({
        "created_on": FieldValue.serverTimestamp(),
        "msg": msg,
        "uid": sellerId,
      });
    }
  }
}
