import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../main.dart';

class PhoneLoginScreen extends StatefulWidget { const PhoneLoginScreen({super.key});
  @override State<PhoneLoginScreen> createState() => _PhoneLoginScreenState(); }
class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final c = TextEditingController(); bool loading=false;
  Future<void> send() async {
    final phone='+91${c.text.trim()}'; if (c.text.trim().length != 10) return;
    setState(()=>loading=true);
    try { await AuthService.sendOtp(phone: phone, codeSent: (id) {
      if (!mounted) return; Navigator.push(context, MaterialPageRoute(builder: (_) => OtpRoute(verificationId:id, phone:phone)));
    }); } catch(e) { if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e'))); }
    if(mounted) setState(()=>loading=false);
  }
  @override Widget build(BuildContext context)=>Scaffold(body: SafeArea(child: Padding(padding:const EdgeInsets.all(24),child:Column(crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.center,children:[
    const Text('KaajLagbe',style:TextStyle(fontSize:34,fontWeight:FontWeight.bold)), const SizedBox(height:8),
    const Text('Find trusted local workers near you.'), const SizedBox(height:32),
    TextField(controller:c,keyboardType:TextInputType.phone,maxLength:10,decoration:const InputDecoration(prefixText:'+91 ',labelText:'Mobile number',border:OutlineInputBorder())),
    const SizedBox(height:16), SizedBox(width:double.infinity,height:52,child:ElevatedButton(onPressed:loading?null:send,child:loading?const CircularProgressIndicator():const Text('Send OTP')))
  ]))));
}
