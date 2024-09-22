import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

DefaultChatTheme customChatTheme()=>DefaultChatTheme(
  backgroundColor: Colors.transparent,
  primaryColor: Colors.blueGrey.withOpacity(.3),
  secondaryColor: Colors.blueGrey.withOpacity(.3),
  inputTextColor: Colors.white,
  inputTextCursorColor: Colors.green,
  sentMessageBodyTextStyle:
  const TextStyle(color: Colors.white),
  receivedMessageBodyTextStyle:
  const TextStyle(color: Colors.white),
  inputContainerDecoration: BoxDecoration(
    color: Colors.transparent,
    border: Border.all(
        color: Colors.white54,
        style: BorderStyle.solid,
        width: 1),
    borderRadius: BorderRadius.circular(30),
    // backgroundBlendMode: BlendMode.clear,
  ),
  inputBorderRadius: BorderRadius.circular(30),
  inputMargin:
  const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
  inputPadding: const EdgeInsets.symmetric(vertical: 5),
  inputBackgroundColor: Colors.white10,
  inputSurfaceTintColor: Colors.transparent,
  inputTextDecoration: const InputDecoration(
    border: InputBorder.none,
    disabledBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
  ),
  deliveredIcon: const FaIcon(FontAwesomeIcons.check),
  documentIcon: const FaIcon(FontAwesomeIcons.check),
  inputElevation: 0,
  seenIcon: const FaIcon(FontAwesomeIcons.check),
);
