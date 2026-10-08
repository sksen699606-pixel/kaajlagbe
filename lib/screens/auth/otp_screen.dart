import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
class OtpScreen extends StatefulWidget { final String verificationId, phone; const OtpScreen({super.key,required this.verificationId,required this.phone}); @override State<OtpScreen> createState()=>_OtpScreenState(); }
class _OtpScreenState extends State<OtpScreen>{ final c=TextEditingController(); bool loading=false;
Future<void> verify() async { setState(()=>loading=true); try{ await AuthService.verifyOtp(widget.verificationId,c.text.trim()); if(mounted) Navigator.pop(context); }catch(e){if(mounted)ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('OTP failed: $e')));} if(mounted)setState(()=>loading=false); }
@override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Verify OTP')),body:Padding(padding:const EdgeInsets.all(24),child:Column(children:[Text('OTP sent to ${widget.phone}'),const SizedBox(height:24),TextField(controller:c,keyboardType:TextInputType.number,maxLength:6,decoration:const InputDecoration(labelText:'6-digit OTP',border:OutlineInputBorder())),SizedBox(width:double.infinity,height:50,child:ElevatedButton(onPressed:loading?null:verify,child:loading?const CircularProgressIndicator():const Text('Verify')))])));
}
