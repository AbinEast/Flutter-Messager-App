import 'package:flutter/material.dart';

/// Chat detail screen displaying the conversation.
/// Supports both individual and group chats.
class ChatDetailScreen extends StatefulWidget {
  /// Chat name or title
  final String name;

  /// Main avatar color
  final Color color;

  /// Profile image URL
  final String imageUrl;

  /// Flag to determine if the chat is individual or group
  final bool isGroup;

  /// Secondary avatar color (for group chat)
  final Color? color2;

  /// Group avatar image URL (optional)
  final String groupImageUrl;

  const ChatDetailScreen({
    Key? key,
    required this.name,
    required this.color,
    required this.imageUrl,
    this.isGroup = false,
    this.color2,
    this.groupImageUrl = '',
  }) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  /// Controller for the message input field
  final TextEditingController _controller = TextEditingController();

  /// List of messages in the chat
  /// Each message includes: text, isSender, time, and senderName (for group chat)
  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Hey! How are you doing today?',
      'isSender': false,
      'time': '9:40 am',
      'senderName': 'Alice'
    },
    {
      'text': 'I\'m doing great! Just finished a project',
      'isSender': true,
      'time': '9:41 am',
      'senderName': 'You'
    },
    {
      'text': 'That\'s awesome! When are you free to meet?',
      'isSender': false,
      'time': '9:42 am',
      'senderName': 'Bob'
    },
    {
      'text': 'I can meet tomorrow afternoon around 2 PM',
      'isSender': true,
      'time': '9:43 am',
      'senderName': 'You'
    },
    {
      'text': 'Perfect! Let\'s meet at the coffee shop near the mall',
      'isSender': false,
      'time': '9:44 am',
      'senderName': 'Alice'
    },
    {
      'text': 'Sounds good! See you tomorrow then',
      'isSender': true,
      'time': '9:45 am',
      'senderName': 'You'
    },
  ];

  /// Sends a new message
  /// The message is added to the list if the input is not empty
  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _controller.text,
          'isSender': true,
          'time': '9:43 am',
          'senderName': 'You'
        });
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      /// AppBar showing chat information
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,

        /// Back button to return to chat list
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),

        /// Title showing avatar and name
        title: Row(
          children: [
            /// Avatar (different for individual and group chats)
            if (widget.isGroup)
              /// Group avatar: single avatar with image or people icon
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: widget.color,
                  /// Show image if a URL is provided
                  image: widget.groupImageUrl.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(widget.groupImageUrl),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                /// Show people icon if no image is provided
                child: widget.groupImageUrl.isEmpty
                    ? const Icon(
                        Icons.people,
                        size: 20,
                        color: Colors.white,
                      )
                    : null,
              )
            else
              /// Individual avatar: profile image or colored background
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: widget.color,
                  image: widget.imageUrl.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(widget.imageUrl),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
            const SizedBox(width: 10),

            /// Chat name or title
            Text(
              widget.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        /// Action buttons: video call and menu
        actions: [
          /// Video call button
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.black, size: 26),
            onPressed: () {},
          ),

          /// Menu button (more options)
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black, size: 26),
            onPressed: () {},
          ),
        ],
      ),

      /// Body containing message list and input field
      body: Column(
        children: [
          /// Scrollable message list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _buildMessageBubble(context, msg);
              },
            ),
          ),

          /// Input field for typing and sending messages
          _buildMessageInput(),
        ],
      ),
    );
  }

  /// For group chats, shows sender name above message bubble
  /// [context] - Build context to get screen size
  /// [msg] - Message data to display
  Widget _buildMessageBubble(BuildContext context, Map<String, dynamic> msg) {
    return Align(
      /// Position: right for user's messages, left for others
      alignment: msg['isSender'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        /// Text alignment: right for user, left for others
        crossAxisAlignment: msg['isSender'] ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          /// Show sender name only in group chats and not for the user
          if (!msg['isSender'] && widget.isGroup)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text(
                msg['senderName'] ?? 'Unknown',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
            ),

          /// Message bubble
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              /// Different color: blue for user, gray for others
              color: msg['isSender'] ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              msg['text'],
              style: TextStyle(
                color: msg['isSender'] ? Colors.white : Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the message input area
  /// Contains: attach button, text field, and send button
  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[300]!, width: 0.5),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            /// Attach file button
            IconButton(
              icon: Icon(Icons.attach_file, color: Colors.grey[600]),
              onPressed: () {},
            ),

            /// Text field for typing messages
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Message',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),

            /// Send message button
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: _sendMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
