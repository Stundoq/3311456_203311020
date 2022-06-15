import 'package:ders_proje/screens/ana_sayfa.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'ana_sayfa.dart';

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({Key? key}) : super(key: key);

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  late FirebaseAuth auth;
  final emailCont = TextEditingController();
  final passwdCont = TextEditingController();

  @override
  void initState() {
    auth = FirebaseAuth.instance;
    super.initState();
  }

  void loginUserEmailAndPassword() async {

      var _userCredential = await auth.signInWithEmailAndPassword(
          email: emailCont.text, password: passwdCont.text);
      debugPrint(_userCredential.toString());
  }

  void googleIleGiris() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnaSayfa()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailCont,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                  ),
                  labelText: 'Kullanıcı Adı: ',
                  labelStyle: TextStyle(color: Colors.lightBlue),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: passwdCont,
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                  ),
                  labelText: 'Şifre: ',
                  labelStyle: TextStyle(color: Colors.lightBlue),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    child: Text(
                      'Üye Ol',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailCont.text, password: passwdCont.text);
                    },
                  ),
                  MaterialButton(
                    child: Text(
                      'Şifremi Unuttum',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailCont.text);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      loginUserEmailAndPassword();
                    },
                    child: Text('Giriş Yap'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      googleIleGiris();
                    },
                    label: Text('Google İle Giriş Yap'),
                    icon: FaIcon(FontAwesomeIcons.google),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
