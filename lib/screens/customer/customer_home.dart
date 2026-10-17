import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class CustomerHome extends StatelessWidget {
const CustomerHome({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('KaajLagbe'),
actions: [
IconButton(
onPressed: AuthService.signOut,
icon: const Icon(Icons.logout),
),
],
),
body: Padding(
padding: const EdgeInsets.all(20),
child: ListView(
children: [
const Text(
'What work do you need?',
style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
),
const SizedBox(height: 18),
Wrap(
spacing: 12,
runSpacing: 12,
children: [
'Plumber',
'Electrician',
'Mason',
'Painter',
'Carpenter',
'Helper',
].map((category) {
return ActionChip(
label: Text(category),
onPressed: () => _post(context, category),
);
}).toList(),
),
const SizedBox(height: 28),
Card(
child: ListTile(
leading: const CircleAvatar(child: Icon(Icons.person)),
title: const Text('Raju S.'),
subtitle: const Text('Plumber • 4.8 ⭐ • 3 km'),
trailing: ElevatedButton(
onPressed: () {},
child: const Text('View'),
),
),
),
],
),
),
);
}

void _post(BuildContext context, String category) {
showModalBottomSheet<void>(
context: context,
builder: (sheetContext) {
return Padding(
padding: const EdgeInsets.all(24),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
Text(
'Post $category Job',
style: const TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 16),
const TextField(
decoration: InputDecoration(labelText: 'Describe the work'),
),
const SizedBox(height: 16),
SizedBox(
width: double.infinity,
child: ElevatedButton(
onPressed: () => Navigator.pop(sheetContext),
child: const Text('Post Job'),
),
),
],
),
);
},
);
}
}
