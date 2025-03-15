// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:el_sheikh/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatsProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  ChatModel? selectedChatModel;
  bool loadChats = false;
  final supabase = Supabase.instance.client;
  ChatsProvider() {
    getChats();
  }
  getChats() async {
    try {
      supabase.from("chats").stream(primaryKey: ['id']).listen((event) {
        chatList.clear();
        notifyListeners();
        event.map((data) => chatList.add(ChatModel.fromJson(data))).toList();
        loadChats = true;
        notifyListeners();
        log(chatList.toString());
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  selectedChat({required ChatModel chatModel}) {
    selectedChatModel = chatModel;
    notifyListeners();
  }

  closeChat({required BuildContext context}) async {
    log(selectedChatModel!.id.toString());
    await supabase
        .from("chats")
        .upsert({"close": true, "id": selectedChatModel!.id}).eq(
            "id", selectedChatModel!.id);
    await supabase
        .from("explanation")
        .upsert({"close": true, "id": selectedChatModel!.id}).eq(
            "id", selectedChatModel!.id);

    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("تم ايقاف المحادثة")));
  }

  deleteChat({required BuildContext context}) async {
    await supabase.from("chats").delete().eq("id", selectedChatModel!.id);
    await supabase
        .from("explanation")
        .upsert({"delete_chat": true, "id": selectedChatModel!.id}).eq(
            "id", selectedChatModel!.id);

    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("تم حذف المحادثة")));
  }
}
