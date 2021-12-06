import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Register in to BugTracker', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w300)),
            const SizedBox(height: 30),
            Container(
              width: 350,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color:  Colors.white10,
                borderRadius: BorderRadius.circular(3)
              ),
              child: _form(),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'register_screen'),
              child: const Text('Do your have an Account? go to Login', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w300))
            )
          ],
        ),
      ),
    );
  }
    _form() {

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          textFormfield(title: 'Username'),
          textFormfield(title: 'E-mail address'),
          textFormfield(title: 'Password'),
          const SizedBox(height: 20),
          button(title: 'Sign In'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  textFormfield ( {String title = ''} ) {

    const textStyle = TextStyle(
      color: Colors.white, 
      fontSize: 15
    );

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(title, style: textStyle),
          const SizedBox(height: 10),
          TextFormField(          
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
            ),
          ),
        ],
      );
  }

  button({ String title = '' }) {
    return MaterialButton(
      child: Text(title,),
      height: 40,
      minWidth: double.maxFinite,
      color: Colors.green,
      onPressed: () {}
    );
  }
}