import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:allinonecalc/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../models/UserModel.dart';
import '../utils/date_presentation.dart';
import '../utils/size_config.dart';

const String ONLINE_STAUS = "ONLINE";
const String OFFLINE_STAUS = "OFFLINE";
const String TYPING_STAUS = "TYPING";



class ChatScreen extends StatefulWidget {
   User user;
   ChatScreen({required this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  bool emojiShowing = false;
  FocusNode chatFocusNode = new FocusNode();
  TextEditingController _chatFieldController = new TextEditingController();

  String CHATS_COLLECTION="chats";
  String chatRoomId="ch1";
  late FirebaseFirestore firestore;

  bool isTyping=false;
  bool isScrollToEnd = true;


  @override
  void initState() {
    super.initState();
    firestore=FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget getLastOnlineTimeWidget(Timestamp? lastOnline) {
    if (lastOnline == null) return Container();

    String time = "";
    DateTime date = lastOnline.toDate();
    DateTime current = DateTime.now();
    //MyPrint.printOnConsole("Duration:${current.difference(date).inDays}");
    int difference = DatePresentation.getDifferenceBetweenDatesInDays(date, current);

    if (difference == 0) {
      time = "today at " + DateFormat("hh:mm aa").format(lastOnline.toDate());
    }
    else if (difference == 1) {
      time = "yesterday at " + DateFormat("hh:mm aa").format(lastOnline.toDate());
    }
    else if (difference < 365) {
      time = DateFormat("hh:mm aa | dd MMM yyyy").format(lastOnline.toDate());
    }
    else {
      time = DateFormat("hh:mm aa | dd MMM yy").format(lastOnline.toDate());
    }

    return Container(
      margin: EdgeInsets.only(top:5),
      child: Text(
        "last seen ${time}",
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }


  Widget getMessageTextField( UserModel myUserModel) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MySize.getScaledSizeHeight(8),
              vertical: MySize.getScaledSizeHeight(0)),
          padding: EdgeInsets.symmetric(
              horizontal: MySize.getScaledSizeHeight(8),
              vertical: MySize.getScaledSizeHeight(5)),
          decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(MySize.getScaledSizeHeight(100))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  emojiShowing = !emojiShowing;
                  if (emojiShowing) {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  } else {
                    FocusScope.of(context).requestFocus(chatFocusNode);
                  }
                  setState(() {});
                },
                child: Container(
                  //margin: EdgeInsets.only(bottom: MySize.size10!),
                    child: Icon(
                      emojiShowing ? Icons.keyboard : Icons.tag_faces,
                      color: Styles.mainColor,
                    )),
              ),
              Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MySize.getScaledSizeHeight(5)),
                  color: Colors.grey,
                  width: MySize.getScaledSizeWidth(.5),
                  height: MySize.getScaledSizeHeight(24)),
              InkWell(
                onTap: (){
                  // onGifTap(
                  //   chatRoomId,
                  //   myUserModel,
                  //   otherUserModel!,
                  //   chatRoomModel?.userMute?[otherUserModel?.id ?? ""] ?? false,
                  // );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  child: Image.asset("assets/logo/gif.png",height: 22,width: 22,),
                ),
              ),
              SizedBox(width:3 ,),
              Expanded(
                child: Container(
                  height: 40,
                  child: TextField(
                    controller: _chatFieldController,
                    showCursor: true,
                    onTap: () {
                      emojiShowing = false;
                      setState(() {});
                    },
                    onChanged: (String? val) {
                      if (val != null && val.isNotEmpty) {
                        if (!isTyping) {
                          firestore
                              .collection(CHATS_COLLECTION)
                              .doc(chatRoomId)
                              .update({
                            "userActivity.${myUserModel.id}": TYPING_STAUS
                          });
                        }
                      }
                      else {
                        if (isTyping) {
                          firestore
                              .collection(CHATS_COLLECTION)
                              .doc(chatRoomId)
                              .update(
                              {"userActivity.${myUserModel.id}": ONLINE_STAUS});
                        }
                      }
                    },
                    focusNode: chatFocusNode,
                    cursorColor:Colors.blue,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "pp kaik lakh",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: MySize.getScaledSizeHeight(13),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 2),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: MySize.size16,
                    ),
                    maxLines: 5,
                    minLines: 1,
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(300),
                    ],
                    // maxLength: 300,

                    textInputAction: TextInputAction.newline,
                    //maxLength: 500,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if(_chatFieldController.text.isNotEmpty) {
                    String status = DatePresentation.getDifferenceBetweenDatesInMinutes(myUserModel.last_online?.toDate() ?? DateTime.now().subtract(Duration(minutes: 10)), DateTime.now()) > 1 ? OFFLINE_STAUS : ONLINE_STAUS;
                    firestore.collection(CHATS_COLLECTION).doc(chatRoomId).update({"userActivity.${myUserModel.id ?? ""}": status}).then((value) {
                     // MyPrint.printOnConsole("Updated User Status To $status From ChatRoomScreen Message textField");
                    });

                    // String newChatId = Uuid().v1().replaceAll("-", "");
                    // ChatModel chatModel = ChatModel(
                    //   id: newChatId,
                    //   message: _chatFieldController.text,
                    //   createdtime: Timestamp.now(),
                    //   senderId: myUserModel.id ?? "",
                    //   type: "text",
                    //   mediaMetaModel: MediaMetaModel.fromMap({}),
                    // );
                    //
                    // sendMessage(
                    //   chatRoomId,
                    //   myUserModel,
                    //   otherUserModel!,
                    //   chatRoomModel?.userMute?[otherUserModel?.id ?? ""] ?? false,
                    //   chatModel,
                    //   otherUserIds,
                    // );
                    isScrollToEnd = true;
                    _chatFieldController.clear();
                    setState(() {});
                  }
                },
                child: Container(
                  //margin: EdgeInsets.only(left: MySize.size10!, bottom: MySize.size4!),
                  // padding: EdgeInsets.symmetric(
                  //     horizontal: MySize.getScaledSizeHeight(8),
                  //     vertical: MySize.getScaledSizeHeight(8)),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(MySize.getScaledSizeHeight(100)),
                      color: Colors.red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.send,
                        size: MySize.getScaledSizeHeight(20),
                        color: Colors.white,
                      ),
                    )),
              ),
            ],
          ),
        ),

        _emojiView()

      ],
    );
  }
  void _onBackspacePressed() {
    _chatFieldController
      ..text = _chatFieldController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: _chatFieldController.text.length),
      );
  }

  void _onEmojiSelected(Emoji emoji) {
    _chatFieldController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: _chatFieldController.text.length),
      );
  }

  Widget _emojiView() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Offstage(
        offstage: !emojiShowing,
        child: SizedBox(
          height: 250,
          child: EmojiPicker(
            onEmojiSelected: (Category? category, Emoji emoji) {
              _onEmojiSelected(emoji);
            },
            onBackspacePressed: _onBackspacePressed,
            config: Config(
                columns: 7,
                // Issue: https://github.com/flutter/flutter/issues/28894
                emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                verticalSpacing: 0,
                horizontalSpacing: 0,
                initCategory: Category.RECENT,
                bgColor: const Color(0xFFF2F2F2),
                indicatorColor: Colors.blue,
                iconColor: Colors.grey,
                iconColorSelected: Colors.blue,
                backspaceColor: Colors.blue,
                showRecentsTab: true,
                recentsLimit: 28,
                noRecents: Text(
                  "send emoji",
                  style: TextStyle(fontSize: 20, color: Colors.black26),
                ),
                tabIndicatorAnimDuration: kTabScrollDuration,
                categoryIcons: const CategoryIcons(),
                buttonMode: ButtonMode.MATERIAL),
          ),
          /*child: ChatPickers(
              chatController: _chatFieldController,
              emojiPickerConfig: EmojiPickerConfig(
                columns: 8,
                numRecommended: 10,
                bgBarColor: Colors.white,
                bgColor: Colors.white,
                //optional configure  (as below)
              ),
              giphyPickerConfig: GiphyPickerConfig(
                apiKey: "CVFyL9esO1Ql28fIo9hBaxgfRnvLLRzF",
                lang: "en",
                showPreviewPage: true,
                onSelected: (gif){
                  _addGifMessage(gif);
                }
                // other optional configure (as below)
              ),
          ),*/
        ),
      ),
    );
  }



}
