import 'package:flutter/material.dart';

/// Model for individual chat data
/// Stores sender information, message, time, and unread status
class ChatModel {
  /// Name of the chat sender
  final String name;
  
  /// Last message in the chat
  final String message;
  
  /// Time of the last message
  final String time;
  
  /// Avatar/background color of the sender
  final Color color;
  
  /// Profile image URL of the sender
  final String imageUrl;
  
  /// Status indicating whether the chat has unread messages
  final bool hasUnread;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.color,
    required this.imageUrl,
    this.hasUnread = false,
  });
}

/// Model for group chat data
/// Stores group information with two avatars
class GroupChatModel {
  /// Group chat name or title
  final String title;
  
  /// Subtitle or last message in the group chat
  final String subtitle;
  
  /// First color for the group avatar (first member)
  final Color color1;
  
  /// Second color for the group avatar (second member)
  final Color color2;

  GroupChatModel({
    required this.title,
    required this.subtitle,
    required this.color1,
    required this.color2,
  });
}

/// Model for story/user profile data
/// Displays user avatar at the top section
class StoryModel {
  /// User's name
  final String name;
  
  /// Background color if no image is provided
  final Color color;
  
  /// Profile image URL of the user
  final String imageUrl;

  StoryModel({
    required this.name,
    required this.color,
    this.imageUrl = '',
  });
}
