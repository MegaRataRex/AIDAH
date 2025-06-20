import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _showSuggestions = true; // Track whether to show suggestions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // Welcome section
          _buildWelcomeSection(),
          
          // Separation line
          Container(
            height: 1.0,
            color: AppColors.lightGray,
          ),
          
          // Chat messages area
          Expanded(
            child: _buildChatArea(),
          ),
          
          // Separation line
          Container(
            height: 1.0,
            color: AppColors.lightGray,
          ),
          
          // Input field
          _buildInputField(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset(
          'assets/icons/arrow_left.png',
          width: 24.0,
          height: 24.0,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'AIDAH HELP',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Image.asset(
            'assets/icons/three_dots.png',
            width: 24.0,
            height: 24.0,
          ),
          onPressed: () {
            print('Menu tapped');
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          height: 1.0,
          color: AppColors.lightGray,
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Welcome text with bolder styling
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hola, ',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold, // Made bolder
                              color: AppColors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Maria.',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold, // Made bolder
                              color: AppColors.lightPurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      '¿Cómo te podemos',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600, // Made bolder
                        color: AppColors.black,
                      ),
                    ),
                    const Text(
                      'ayudar hoy?',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold, // Made bolder
                        color: AppColors.lightTeal,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Illustration
              Container(
                width: 100.0,
                height: 100.0,
                child: Image.asset(
                  'assets/images/help_illustration.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16.0),
          
          const Text(
            'Escribe tu pregunta',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500, // Made slightly bolder
              color: AppColors.textGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        children: [
          // Show suggestions only if no messages and _showSuggestions is true
          if (_showSuggestions && _messages.isEmpty) ...[
            _buildSuggestedMessages(),
            const SizedBox(height: 16.0),
            // Date
            Center(
              child: Text(
                '06/06/2025',
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColors.textGray.withOpacity(0.6),
                ),
              ),
            ),
          ],
          
          // Chat messages - now takes full available space when suggestions are hidden
          if (_messages.isNotEmpty) ...[
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ),
          ] else if (!_showSuggestions) ...[
            // Show empty space when suggestions are hidden but no messages yet
            const Expanded(
              child: Center(
                child: Text(
                  'Comienza la conversación...',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: AppColors.textGray,
                  ),
                ),
              ),
            ),
          ],
          
          // Add spacer if suggestions are shown to push them up
          if (_showSuggestions && _messages.isEmpty) const Spacer(),
        ],
      ),
    );
  }

  Widget _buildSuggestedMessages() {
    final suggestions = [
      {
        'text': '¿Cómo puedo realizar el test FDAH?',
        'color': AppColors.lighterPurple,
      },
      {
        'text': '¿En todos los cursos obtengo una certificación?',
        'color': AppColors.lightTeal,
      },
      {
        'text': '¿Cómo puedo crear cursos en la app?',
        'color': AppColors.lightPurple,
      },
    ];

    return Container(
      // Light gray background container for suggestions
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bot avatar with round purple background
          Container(
            width: 40.0,
            height: 40.0,
            margin: const EdgeInsets.only(right: 12.0, top: 8.0),
            decoration: BoxDecoration(
              color: AppColors.lightPurple,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/bird.png',
                width: 24.0,
                height: 24.0,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: suggestions.map((suggestion) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  child: GestureDetector(
                    onTap: () => _sendSuggestedMessage(suggestion['text'] as String),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: suggestion['color'] as Color,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        suggestion['text'] as String,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    final isUser = message['isUser'] as bool;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            Container(
              width: 40.0,
              height: 40.0,
              margin: const EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                color: AppColors.lightPurple,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/bird.png',
                  width: 24.0,
                  height: 24.0,
                ),
              ),
            ),
          ],
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: isUser 
                    ? AppColors.primaryPurple 
                    : AppColors.lightGray.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                message['text'] as String,
                style: TextStyle(
                  fontSize: 14.0,
                  color: isUser ? AppColors.white : AppColors.black,
                ),
              ),
            ),
          ),
          if (isUser) ...[
            Container(
              width: 40.0,
              height: 40.0,
              margin: const EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/user_avatar.png',
                  width: 24.0,
                  height: 24.0,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // User avatar with light background
          Container(
            width: 40.0,
            height: 40.0,
            margin: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/user_avatar.png',
                width: 24.0,
                height: 24.0,
              ),
            ),
          ),
          
          // Input field
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightGray.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: 'Escribe tu mensaje...',
                  hintStyle: TextStyle(
                    color: AppColors.textGray,
                    fontSize: 14.0,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 12.0,
                  ),
                ),
                onSubmitted: (text) => _sendMessage(text),
              ),
            ),
          ),
          
          const SizedBox(width: 8.0),
          
          // Send button
          GestureDetector(
            onTap: () => _sendMessage(_messageController.text),
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: AppColors.lighterPurple,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/send.png',
                  width: 20.0,
                  height: 20.0,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendSuggestedMessage(String message) {
    setState(() {
      _showSuggestions = false; // Hide suggestions when user selects one
    });
    _sendMessage(message);
  }

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;
    
    setState(() {
      // Hide suggestions when user starts typing their own message
      _showSuggestions = false;
      
      _messages.add({
        'text': message,
        'isUser': true,
        'timestamp': DateTime.now(),
      });
      
      // Simulate bot response
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages.add({
            'text': 'Gracias por tu pregunta. Te ayudo con eso...',
            'isUser': false,
            'timestamp': DateTime.now(),
          });
        });
      });
    });
    
    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}