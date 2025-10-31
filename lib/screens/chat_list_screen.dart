import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import 'chat_detail_screen.dart';

/// Main screen that displays the list of chats
/// Consists of stories, group chats, and individual chats
class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  /// List of user stories/profiles displayed at the top
  /// Contains 8 users with different avatars and names
  static final List<StoryModel> stories = [
    StoryModel(name: 'Alice', color: Colors.red, imageUrl: 'https://dk2dv4ezy246u.cloudfront.net/widgets/sSxi2obHDBef_large.jpg'),
    StoryModel(name: 'Bob', color: Colors.orange, imageUrl: 'https://thumbs.dreamstime.com/b/nmp-letter-logo-design-black-background-creative-initials-concept-241006871.jpg'),
    StoryModel(name: 'Charlie', color: Colors.green, imageUrl: 'https://cdn.pfps.gg/pfps/2174-cartoon-11.png'),
    StoryModel(name: 'Diana', color: Colors.blue, imageUrl: 'https://www.pfpgeeks.com/static/images/cute-pfp/webp/cute-pfp-4.webp'),
    StoryModel(name: 'Eve', color: Colors.purple, imageUrl: 'https://wallpapers.com/images/hd/anime-pfp-pictures-k67w5w2uxro4irhs.jpg'),
    StoryModel(name: 'Frank', color: Colors.teal, imageUrl: 'https://i.pinimg.com/originals/3c/c9/32/3cc932bc974bfeee8829705ea4dc4fda.jpg'),
    StoryModel(name: 'Grace', color: Colors.pink, imageUrl: 'https://wallpapers-clan.com/wp-content/uploads/2022/10/dark-aesthetic-anime-pfp-22.jpg'),
    StoryModel(name: 'Henry', color: Colors.indigo, imageUrl: 'https://m.gettywallpapers.com/wp-content/uploads/2023/11/Cool-Neon-pfp.jpg'),
  ];

  /// List of group chats with two-person avatars
  static final List<GroupChatModel> groupChats = [
    GroupChatModel(
      title: 'Friend Forever',
      subtitle: 'Jonny: dam ngan',
      color1: Colors.blue.shade300,
      color2: Colors.orange.shade300,
    ),
    GroupChatModel(
      title: 'Work Team',
      subtitle: 'Sarah: See you!',
      color1: Colors.purple.shade300,
      color2: Colors.pink.shade300,
    ),
  ];

  /// List of individual chats with 9 contacts
  static final List<ChatModel> chats = [
    ChatModel(
      name: 'Ruben Torff',
      message: 'I\'m doing great! Just finished a project',
      time: '10:56 AM',
      color: Colors.pink.shade200,
      imageUrl: 'https://i.pinimg.com/736x/85/18/ca/8518ca4f01ff414bb3ac70d22835003c.jpg',
      hasUnread: false,
    ),
    ChatModel(
      name: 'Lydia Lubin',
      message: 'That\'s awesome! When are you free to meet?',
      time: 'Yesterday',
      color: Colors.blue.shade300,
      imageUrl: 'https://i.pinimg.com/736x/06/68/17/06681782b619ce545f1a1d2db9684db2.jpg',
      hasUnread: false,
    ),
    ChatModel(
      name: 'Jakob Siphon',
      message: 'I can meet tomorrow afternoon around 2 PM',
      time: '23 Jan',
      color: Colors.orange.shade300,
      imageUrl: 'https://wallpapers-clan.com/wp-content/uploads/2023/05/cool-pfp-30.jpg',
      hasUnread: true,
    ),
    ChatModel(
      name: 'Jaxson Botosh',
      message: 'Perfect! Let\'s meet at the coffee shop near the mall',
      time: 'Yesterday',
      color: Colors.purple.shade200,
      imageUrl: 'https://cutiedp.com/wp-content/uploads/2025/09/Hamster-cute-pfp.webp',
      hasUnread: false,
    ),
    ChatModel(
      name: 'Sarah Mitchell',
      message: 'Sounds good! See you tomorrow then',
      time: '2 hours ago',
      color: Colors.green.shade300,
      imageUrl: 'https://wallpapers-clan.com/wp-content/uploads/2022/05/cute-pfp-02.jpg',
      hasUnread: true,
    ),
    ChatModel(
      name: 'Michael Chen',
      message: 'Let\'s discuss the project details tomorrow',
      time: '3 hours ago',
      color: Colors.teal.shade300,
      imageUrl: 'https://images.wondershare.com/filmora/article-images/2022/cool-tiktok-pfp.jpg',
      hasUnread: false,
    ),
    ChatModel(
      name: 'Emma Wilson',
      message: 'Did you check the latest design mockups?',
      time: '5 hours ago',
      color: Colors.amber.shade300,
      imageUrl: 'https://i.pinimg.com/736x/70/21/96/7021961e5f69743d14d12d4be69e3a82.jpg',
      hasUnread: true,
    ),
    ChatModel(
      name: 'David Brown',
      message: 'The presentation went really well yesterday!',
      time: 'Yesterday',
      color: Colors.indigo.shade300,
      imageUrl: 'https://i.imgur.com/1TKxjL4.jpeg',
      hasUnread: false,
    ),
    ChatModel(
      name: 'Sophia Lee',
      message: 'Looking forward to the meeting next week',
      time: '2 days ago',
      color: Colors.red.shade300,
      imageUrl: 'https://wallpapers-clan.com/wp-content/uploads/2022/05/cute-pfp-08.jpg',
      hasUnread: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header with title and action buttons
            _buildHeader(),
            
            /// Stories section with horizontal scroll
            _buildStoriesSection(context),
            
            const SizedBox(height: 16),
            
            /// Section title "Group Chats"
            _buildSectionTitle('Group Chats'),
            
            const SizedBox(height: 12),
            
            /// Group chats list with horizontal scroll
            _buildGroupChatsSection(context),
            
            const SizedBox(height: 16),
            
            /// Section title "Chats"
            _buildSectionTitle('Chats'),
            
            const SizedBox(height: 8),
            
            /// Individual chats list with vertical scroll
            Expanded(
              child: _buildChatsList(context),
            ),
          ],
        ),
      ),
      
      /// Bottom navigation bar with 4 main menus
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  /// Builds the header with title "Chats" and action buttons
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// App title
          const Text(
            'Chats',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          /// Action buttons: search, new chat, menu
          Row(
            children: [
              _buildHeaderButton(Icons.search),
              const SizedBox(width: 8),
              _buildHeaderButton(Icons.chat_bubble_outline),
              const SizedBox(width: 8),
              _buildHeaderButton(Icons.menu),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds small circular buttons in the header
  /// [icon] - Icon displayed inside the button
  Widget _buildHeaderButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 20),
    );
  }

  /// Builds stories/profiles section with horizontal scroll
  /// Each story is clickable to open the chat
  Widget _buildStoriesSection(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            
            /// Makes story item clickable
            child: GestureDetector(
              onTap: () {
                /// Navigate to chat detail screen when story is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatDetailScreen(
                      name: story.name,
                      color: story.color,
                      imageUrl: story.imageUrl,
                    ),
                  ),
                );
              },
              child: _buildStoryItem(story),
            ),
          );
        },
      ),
    );
  }

  /// Builds a story item with rounded avatar
  /// [story] - Story data to display
  Widget _buildStoryItem(StoryModel story) {
    return Column(
      children: [
        /// Outer container for blue border
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
          ),
          
          /// Inner container for image or name initial
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: story.color,
              image: story.imageUrl.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(story.imageUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            
            /// Displays name initial if no image available
            child: story.imageUrl.isEmpty
                ? Center(
                    child: Text(
                      story.name[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }

  /// Builds section title (Group Chats or Chats)
  /// [title] - Title text to display
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Builds group chats section with horizontal scroll
  /// Each group chat is clickable to open group chat detail
  Widget _buildGroupChatsSection(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: groupChats.length,
        itemBuilder: (context, index) {
          final group = groupChats[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            
            /// Makes group chat item clickable
            child: GestureDetector(
              onTap: () {
                /// Navigate to chat detail screen with isGroup = true
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatDetailScreen(
                      name: group.title,
                      color: group.color1,
                      imageUrl: '',
                      isGroup: true,
                      color2: group.color2,
                    ),
                  ),
                );
              },
              child: _buildGroupChatItem(group),
            ),
          );
        },
      ),
    );
  }

  /// [group] - Group chat data to display
  Widget _buildGroupChatItem(GroupChatModel group) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          /// Group chat avatar
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: group.color1,
            ),
            child: const Icon(
              Icons.people,
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 30),
          
          /// Group chat info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Group name/title
                Text(
                  group.title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                
                /// Subtitle (last message)
                Text(
                  group.subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a vertically scrollable list of individual chats
  /// Each chat can be tapped to open the detail screen
  Widget _buildChatsList(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return _buildChatItem(context, chat);
      },
    );
  }

  /// Builds a single chat item using ListTile
  /// [context] - Build context for navigation
  /// [chat] - Chat data to display
  Widget _buildChatItem(BuildContext context, ChatModel chat) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      
      /// Navigate to chat detail when tapped
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(
              name: chat.name,
              color: chat.color,
              imageUrl: chat.imageUrl,
            ),
          ),
        );
      },
      
      /// Profile avatar
      leading: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: chat.color,
          image: DecorationImage(
            image: NetworkImage(chat.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
      
      /// Sender name
      title: Text(
        chat.name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      
      /// Last message preview
      subtitle: Text(
        chat.message,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      
      /// Chat time and unread indicator
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// Last message time
          Text(
            chat.time,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            ),
          ),
          
          /// Unread chat indicator (green dot)
          if (chat.hasUnread)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  /// Builds the bottom navigation bar with 4 main menus
  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!, width: 0.5),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          /// Messenger menu (active)
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger, size: 28),
            label: '',
          ),
          
          /// Phone menu
          BottomNavigationBarItem(
            icon: Icon(Icons.phone, size: 28),
            label: '',
          ),
          
          /// People menu
          BottomNavigationBarItem(
            icon: Icon(Icons.people, size: 28),
            label: '',
          ),
          
          /// Settings menu
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 28),
            label: '',
          ),
        ],
      ),
    );
  }
}
