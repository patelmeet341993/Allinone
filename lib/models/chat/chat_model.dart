import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:allinonecalc/models/chat/media_meta_model.dart';
import 'package:allinonecalc/utils/date_presentation.dart';

class ChatModel {
  String id, message, senderId, type;
  Timestamp? createdtime;
  MediaMetaModel mediaMetaModel;

  ChatModel({
    this.id = "",
    this.message = "",
    this.senderId = "",
    this.type = "text",
    this.createdtime,
    required this.mediaMetaModel
  });

  static ChatModel fromMap(Map<String, dynamic> map) {
    String id, message, senderId, type;
    Timestamp? createdtime;
    MediaMetaModel mediaMetaModel;

    id = map['id'] != null ? map['id'] : "";
    message = map['message'] != null ? map['message'] : "";
    senderId = map['senderId'] != null ? map['senderId'] : "";
    type = map['type'] != null ? map['type'] : "text";
    createdtime = map['createdtime'];
    mediaMetaModel = MediaMetaModel.fromMap(map['mediaMetaModel'] ?? {});

    return ChatModel(
      id: id,
      message: message,
      senderId: senderId,
      createdtime: createdtime,
      type: type,
      mediaMetaModel: mediaMetaModel,
    );
  }

  static ChatModel elasticFromMap(Map<String, dynamic> map) {
    String id, message, senderId, type;
    Timestamp? createdtime;
    MediaMetaModel mediaMetaModel;

    id = map['id'] != null ? map['id'] : "";
    message = map['message'] != null ? map['message'] : "";
    senderId = map['senderId'] != null ? map['senderId'] : "";
    type = map['type'] != null ? map['type'] : "text";
    createdtime = map['createdtime'] != null && map['createdtime'].isNotEmpty ? Timestamp.fromDate(DateTime.parse(map['createdtime'])) : null;
    mediaMetaModel = MediaMetaModel.fromMap(map['mediaMetaModel'] ?? {});

    return ChatModel(
      id: id,
      message: message,
      senderId: senderId,
      type: type,
      createdtime: createdtime,
      mediaMetaModel: mediaMetaModel,
    );
  }

  void updateFromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? map['id'] : "";
    message = map['message'] != null ? map['message'] : "";
    senderId = map['senderId'] != null ? map['senderId'] : "";
    type = map['type'] != null ? map['type'] : "";
    createdtime = map['createdtime'];
    mediaMetaModel = MediaMetaModel.fromMap(map['mediaMetaModel'] ?? {});
  }

  Map<String, dynamic> toMap() {
    return {
      "id" : id,
      "message" : message,
      "senderId" : senderId,
      "type" : type,
      "createdtime" : createdtime,
      "mediaMetaModel" : mediaMetaModel.toMap(),
    };
  }

  Map<String, dynamic> elasticToMap() {
    return {
      "id" : id,
      "message" : message,
      "senderId" : senderId,
      "type" : type,
      "createdtime" : createdtime != null ? DatePresentation.yyyyMMddHHmmssFormatter(createdtime!) : null,
      "mediaMetaModel" : mediaMetaModel.toMap(),
    };
  }

  @override
  String toString() {
    return "Id:${id}, Message:${message}, SenderId:${senderId}, type:${type}, CreatedTime:${createdtime}, mediaMetaModel:${mediaMetaModel}";
  }


}