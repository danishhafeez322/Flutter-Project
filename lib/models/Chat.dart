class Chat {
  final String uid,name, lastMessage,  time;
  // final bool isActive;

  Chat({
    required this.uid,
    required this.name,
    required this.lastMessage,
    // required this.image,
    required this.time,
    // required this.isActive,
  });
}

List chatsData = [
  Chat(
    uid: "1",
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well...",
    // image: "assets/images/user.png",
    time: "3m ago",
    // isActive: false,
  ),
  Chat(
    uid: "2",
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    // image: "assets/images/user_2.png",
    time: "8m ago",
    // isActive: true,
  ),
  Chat(
    uid: "3",
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    // image: "assets/images/user_3.png",
    time: "5d ago",
    // isActive: false,
  ),
  Chat(
    uid: "4",
    name: "Jacob Jones",
    lastMessage: "You’re welcome :)",
    // image: "assets/images/user_4.png",
    time: "5d ago",
    // isActive: true,
  ),
  Chat(
    uid: "5",
    name: "Albert Flores",
    lastMessage: "Thanks",
    // image: "assets/images/user_5.png",
    time: "6d ago",
    // isActive: false,
  ),
  Chat(
    uid: "6",
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well...",
    // image: "assets/images/user.png",
    time: "3m ago",
    // isActive: false,
  ),
  Chat(
    uid: "7",
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    // image: "assets/images/user_2.png",
    time: "8m ago",
    // isActive: true,
  ),
  Chat(
    uid: "8",
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    // image: "assets/images/user_3.png",
    time: "5d ago",
    // isActive: false,
  ),
];
