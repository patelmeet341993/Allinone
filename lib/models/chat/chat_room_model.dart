import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:allinonecalc/models/chat/chat_model.dart';
import 'package:allinonecalc/models/UserModel.dart';
import 'package:allinonecalc/utils/date_presentation.dart';

class ChatRoomModel {
  String? id;
  Timestamp? createdtime, lastUpdatedTime;
  List<String>? participants;
  Map<String, UserModel>? userModels;
  Map<String, String>? userActivity;
  Map<String, Timestamp?>? userLastClearTime;
  Map<String, bool>? userMute;
  List<ChatModel> chats;
  ChatModel? last_chat;
  bool isSmatched, isCalling;

  ChatRoomModel({
    this.id,
    this.createdtime,
    this.lastUpdatedTime,
    this.participants,
    this.userModels,
    this.userActivity,
    this.userLastClearTime,
    this.userMute,
    this.chats = const [],
    this.last_chat,
    this.isSmatched = false,
    this.isCalling = false,
  });

  static ChatRoomModel fromMap(Map<String, dynamic> map) {
    String? id;
    Timestamp? createdtime, lastUpdatedTime;
    List<String>? participants;
    Map<String, String>? userActivity;
    Map<String, Timestamp?>? userLastClearTime;
    Map<String, bool>? userMute;
    Map<String, Map<String, dynamic>> chatsMap;
    List<ChatModel> chats = [];
    ChatModel? last_chat;
    bool isSmatched, isCalling;

    id = map['id'] != null ? map['id'] : "";
    createdtime = map['createdtime'];
    lastUpdatedTime = map['lastUpdatedTime'];
    participants = map['participants'] != null ? List.from(map['participants']) : [];
    userActivity = map['userActivity'] != null ? Map.from(map['userActivity']) : {};
    userLastClearTime = map['userLastClearTime'] != null ? Map.from(map['userLastClearTime']) : {};
    userMute = map['userMute'] != null ? Map.from(map['userMute']) : {};
    last_chat = map['last_chat'] != null ? ChatModel.fromMap(map['last_chat'] ?? {}) : null;

    chatsMap = Map.from(map['chats'] ?? {});
    chatsMap.forEach((String key, Map<String, dynamic> value) {
      chats.add(ChatModel.fromMap(value));
    });
    chats.sort((a, b) {
      if(a.createdtime != null && b.createdtime != null) return a.createdtime!.toDate().compareTo(b.createdtime!.toDate());
      else return 0;
    });
    isSmatched = map['isSmatched'] ?? false;
    isCalling = map['isCalling'] ?? false;

    return ChatRoomModel(
      id: id,
      createdtime: createdtime,
      lastUpdatedTime: lastUpdatedTime,
      participants: participants,
      userModels: {},
      userActivity: userActivity,
      userLastClearTime: userLastClearTime,
      userMute: userMute,
      chats: chats,
      last_chat: last_chat,
      isSmatched: isSmatched,
      isCalling: isCalling,
    );
  }

  static ChatRoomModel elasticFromMap(Map<String, dynamic> map) {
    String? id;
    Timestamp? createdtime, lastUpdatedTime;
    List<String>? participants;
    Map<String, String>? userActivity;
    Map<String, bool>? userMute;
    ChatModel? last_chat;
    bool isSmatched, isCalling;

    id = map['id'] != null ? map['id'] : "";
    createdtime = map['createdtime'] != null && map['createdtime'].isNotEmpty ? Timestamp.fromDate(DateTime.parse(map['createdtime'])) : null;
    lastUpdatedTime = map['lastUpdatedTime'] != null && map['lastUpdatedTime'].isNotEmpty ? Timestamp.fromDate(DateTime.parse(map['lastUpdatedTime'])) : null;
    participants = map['participants'] != null ? List.from(map['participants']) : [];
    userActivity = map['userActivity'] != null ? Map.from(map['userActivity']) : {};
    userMute = map['userMute'] != null ? Map.from(map['userMute']) : {};
    last_chat = map['last_chat'] != null ? ChatModel.elasticFromMap(map['last_chat'] ?? {}) : null;
    isSmatched = map['isSmatched'] ?? false;
    isCalling = map['isCalling'] ?? false;

    return ChatRoomModel(
      id: id,
      createdtime: createdtime,
      lastUpdatedTime: lastUpdatedTime,
      participants: participants,
      userModels: {},
      userActivity: userActivity,
      userMute:userMute,
      chats: [],
      last_chat: last_chat,
      isSmatched: isSmatched,
      isCalling: isCalling,
    );
  }

  void updateFromMap(Map<String, dynamic> map) {
    Map<String, Map<String, dynamic>> chatsMap = {};

    id = map['id'] != null ? map['id'] : "";
    createdtime = map['createdtime'];
    lastUpdatedTime = map['lastUpdatedTime'];
    participants = map['participants'] != null ? List.from(map['participants']) : [];
    userActivity = map['userActivity'] != null ? Map.from(map['userActivity']) : {};
    userLastClearTime = map['userLastClearTime'] != null ? Map.from(map['userLastClearTime']) : {};
    userMute = map['userMute'] != null ? Map.from(map['userMute']) : {};
    last_chat = map['last_chat'] != null ? ChatModel.fromMap(map['last_chat'] ?? {}) : null;
    isSmatched = map['isSmatched'] ?? false;
    isCalling = map['isCalling'] ?? false;

    chats = [];
    chatsMap = Map.from(map['chats'] ?? {});
    chatsMap.forEach((String key, Map<String, dynamic> value) {
      chats.add(ChatModel.fromMap(value));
    });
    chats.sort((a, b) {
      if(a.createdtime != null && b.createdtime != null) return a.createdtime!.toDate().compareTo(b.createdtime!.toDate());
      else if(a.createdtime == null) return 1000;
      else if(b.createdtime == null) return -1000;
      else return 1;
    });
  }

  void elasticUpdateFromMap(Map<String, dynamic> map) {
    List<Map<String, dynamic>>? chatsMap;

    id = map['id'] != null ? map['id'] : "";
    createdtime = map['createdtime'] != null && map['createdtime'].isNotEmpty ? Timestamp.fromDate(DateTime.parse(map['createdtime'])) : null;
    lastUpdatedTime = map['lastUpdatedTime'] != null && map['lastUpdatedTime'].isNotEmpty ? Timestamp.fromDate(DateTime.parse(map['lastUpdatedTime'])) : null;
    participants = map['participants'] != null ? List.from(map['participants']) : [];
    userActivity = map['userActivity'] != null ? Map.from(map['userActivity']) : {};
    userMute = map['userMute'] != null ? Map.from(map['userMute']) : {};
    last_chat = map['last_chat'] != null ? ChatModel.elasticFromMap(map['last_chat'] ?? {}) : null;
    isSmatched = map['isSmatched'] ?? false;
    isCalling = map['isCalling'] ?? false;
  }

  void updateChatFromMap(Map<String, dynamic> map) {
    List<Map<String, dynamic>>? chatsMap;

    chatsMap = map['chats'] != null ? List.from(map['chats']) : [];
    chats = [];
    chatsMap.forEach((Map<String, dynamic> map) {
      chats.add(ChatModel.fromMap(map));
    });
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> chatsMap = {};
    chats.forEach((ChatModel chatModel) {
      chatsMap[chatModel.id] = chatModel.toMap();
    });

    return {
      "id" : id ?? '',
      "createdtime" : createdtime,
      "lastUpdatedTime" : lastUpdatedTime,
      'participants' : participants ?? [],
      "userActivity" : userActivity ?? {},
      "userLastClearTime" : userLastClearTime ?? {},
      "userMute" : userMute ?? {},
      'chats' : chatsMap,
      'isSmatched' : isSmatched,
      'isCalling' : isCalling,
    };
  }

  Map<String, dynamic> elasticToMap() {
    return {
      "id" : id ?? '',
      "createdtime" : createdtime != null ? DatePresentation.yyyyMMddHHmmssFormatter(createdtime!) : null,
      "lastUpdatedTime" : lastUpdatedTime != null ? DatePresentation.yyyyMMddHHmmssFormatter(lastUpdatedTime!) : null,
      'participants' : participants ?? [],
      "userActivity" : userActivity ?? {},
      "userMute" : userMute ?? {},
      'last_chat' : last_chat?.elasticToMap(),
      'isSmatched' : isSmatched,
      'isCalling' : isCalling,
    };
  }

  @override
  String toString() {
    return "Id:${id}, Created Time:${createdtime}, Last Updated Time:${lastUpdatedTime}, Participants:${participants}, "
        "Chats:${chats}, UserMute:${userMute}, isSmatched:${isSmatched}, userActivity:${userActivity}, userLastClearTime:${userLastClearTime},"
        " last_chat:${last_chat}, isCalling:${isCalling}";
  }
}