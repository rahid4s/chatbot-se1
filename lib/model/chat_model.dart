class ChatModel {
  final String question;
  final String answer;
  final DateTime timestamp;

  ChatModel({
    required this.question,
    required this.answer,
    required this.timestamp,
  });
}

/// Dummy data

List<ChatModel> dummyHistory = [
  ChatModel(
    question: "What's your name?",
    answer: "I'm a chatbot!",
    timestamp: DateTime.now(),
  ),
  ChatModel(
    question: "How are you?",
    answer: "I don't have feelings, but I'm here to help!",
    timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  ChatModel(
    question: "Tell me a joke.",
    answer: "Why did the chicken cross the road? To get to the other side!",
    timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
  ),
  ChatModel(
    question: "Who is your creator?",
    answer: "I was created by talented developers using Flutter!",
    timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
  ),
  ChatModel(
    question: "What is the meaning of life?",
    answer: "The answer to the ultimate question of life, the universe, and everything is 42.",
    timestamp: DateTime.now().subtract(const Duration(minutes: 20)),
  ),
  ChatModel(
    question: "What's the weather like today?",
    answer: "I'm sorry, I don't have access to real-time weather information.",
    timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
  ),
  ChatModel(
    question: "Can you do math?",
    answer: "Yes, I can perform basic mathematical calculations.",
    timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
  ),
];
