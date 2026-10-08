import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../main.dart';
class RoleScreen extends StatefulWidget{const RoleScreen({super.key});@override State<RoleScreen> createState()=>_RoleScreenState();}
class _RoleScreenState extends State<RoleScreen>{
  Future<void> choose(String role) async { await AuthService.saveRole(role); if(mounted)Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>RoleHome(role:role))); }
  @override Widget build(BuildContext context)=>Scaffold(body:SafeArea(child:Padding(padding:const EdgeInsets.all(24),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[const Text('How will you use KaajLagbe?',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold)),const SizedBox(height:28),SizedBox(width:double.infinity,height:64,child:ElevatedButton(onPressed:()=>choose('customer'),child:const Text('👤  I am a Customer'))),const SizedBox(height:16),SizedBox(width:double.infinity,height:64,child:OutlinedButton(onPressed:()=>choose('worker'),child:const Text('🛠️  I am a Worker')))]))));
}
