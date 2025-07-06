import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _showSuggestions = true; // Track whether to show suggestions
  bool _hasText = false; // Track if user has typed anything

  @override
  void initState() {
    super.initState();
    // Listen to text changes to update send button color
    _messageController.addListener(() {
      setState(() {
        _hasText = _messageController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      // Add resizeToAvoidBottomInset to handle keyboard properly
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          // Welcome section
          _buildWelcomeSection(),
          
          // Separation line
          Container(
            height: 1.0,
            color: AppColors.lightGray,
          ),
          
          // Chat messages area - this will shrink when keyboard appears
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
        'AIDAH',
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
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Maria.',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
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
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    const Text(
                      'ayudar hoy?',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
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
              fontWeight: FontWeight.w500,
              color: AppColors.textGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatArea() {
    return SingleChildScrollView( // Make the chat area scrollable
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Take minimum space needed
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
            
            // Chat messages
            if (_messages.isNotEmpty) ...[
              ListView.builder(
                shrinkWrap: true, // Important: makes ListView take only needed space
                physics: const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ] else if (!_showSuggestions) ...[
              // Show empty space when suggestions are hidden but no messages yet
              Container(
                height: 200.0, // Fixed height instead of Expanded
                child: const Center(
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
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestedMessages() {
    final suggestions = [
      {
        'text': '¿Cómo puedo realizar el prediagnóstico?',
        'color': AppColors.lighterPurple,
      },
      {
        'text': '¿Cómo puedo personalizar las tareas de mi hijo?',
        'color': AppColors.lightTeal,
      },
      {
        'text': 'Ayudame a crear una rutina divertida para mi hijo',
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
                color: AppColors.lightGray,
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
                onChanged: (text) {
                  // Hide suggestions when user starts typing
                  if (text.isNotEmpty && _showSuggestions) {
                    setState(() {
                      _showSuggestions = false;
                    });
                  }
                },
              ),
            ),
          ),
          
          const SizedBox(width: 8.0),
          
          // Send button - color changes based on _hasText
          GestureDetector(
            onTap: () => _sendMessage(_messageController.text),
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: _hasText 
                    ? AppColors.lighterPurple  // Purple when user has typed
                    : AppColors.lightGray,     // Gray when empty
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/send.png',
                  width: 30.0,
                  height: 30.0,
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

void _sendMessage(String message) async {
  if (message.trim().isEmpty) return;

  setState(() {
    _showSuggestions = false;

    // Add user's message to chat
    _messages.add({
      'text': message,
      'isUser': true,
      'timestamp': DateTime.now(),
    });
  });

  _messageController.clear();

  try {
    // Call backend AI endpoint
    final response = await http.post(
      Uri.parse('http://localhost:8080/ask-ai'), // Replace with your actual URL in prod
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final reply = responseData['response'];

      setState(() {
        _messages.add({
          'text': reply,
          'isUser': false,
          'timestamp': DateTime.now(),
        });
      });
    } else {
      _showErrorMessage();
    }
  } catch (e) {
    _showErrorMessage();
  }
}

void _showErrorMessage() {
  setState(() {
    _messages.add({
      'text': 'Lo siento, hubo un problema al responder. Intenta más tarde.',
      'isUser': false,
      'timestamp': DateTime.now(),
    });
  });
}

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}