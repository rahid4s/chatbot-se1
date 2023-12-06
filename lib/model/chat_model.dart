class ChatModel {
  final String query;
  final String response;
  final DateTime? timestamp;
  final int? id;
  final int? userId;

  ChatModel({
    required this.query,
    required this.response,
    this.timestamp,
    this.userId,
    this.id,
  });
}

/// Dummy data for testing purpose
List<ChatModel> dummyHistory = [
  ChatModel(
    query: "What's your name?",
    response: "I'm a chatbot!",
    timestamp: DateTime.now(),
  ),
  ChatModel(
    query: "How are you?",
    response: "I don't have feelings, but I'm here to help!",
    timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  ChatModel(
    query: "Tell me a joke.",
    response: "Why did the chicken cross the road? To get to the other side!",
    timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
  ),
  ChatModel(
    query: "Who is your creator?",
    response: "I was created by talented developers using Flutter!",
    timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
  ),
  ChatModel(
    query: "What is the meaning of life?",
    response:
        "The answer to the ultimate question of life, the universe, and everything is 42.",
    timestamp: DateTime.now().subtract(const Duration(minutes: 20)),
  ),
  ChatModel(
    query: "What's the weather like today?",
    response:
        "I'm sorry, I don't have access to real-time weather information.",
    timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
  ),
  ChatModel(
    query: "Can you do math?",
    response: "Yes, I can perform basic mathematical calculations.",
    timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
  ),
];
