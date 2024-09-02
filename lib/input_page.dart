import "/home_page.dart";
import "package:flutter/material.dart";



class TextInputPage extends StatefulWidget {
  const TextInputPage({super.key});

  @override
  State<TextInputPage> createState() => _TextInputPageState();
}

class _TextInputPageState extends State<TextInputPage> {
  String chatText = "";
  TextEditingController productNameCont = TextEditingController();
  TextEditingController whatProvideCont = TextEditingController();
  TextEditingController someFeaturesCont = TextEditingController();

  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 18,),
                  FlutterLogo(
                    size: 60.0,
                  ),
                  Text("Gemini with Flutter",
                  style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.w500,)),
                  SizedBox(height: 18,),
                  Text("Write your thoughts",
                  style: TextStyle(
                      color: Colors.amber[800],
                      fontSize: 18,
                      fontWeight: FontWeight.w500,)),
              
                  TextFormField(
                    controller: productNameCont,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,),
                    decoration: InputDecoration(
                      hintText: "Ask me something",
                      hintStyle: TextStyle(
                      color: Color.fromARGB(117, 255, 255, 255),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,),
                      fillColor: Color.fromARGB(255, 89, 88, 88),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      ),
                    validator: (value) {
                       if (value == null || value.isEmpty) {
                          return 'This field can\'t be empty';
                        }
                      return null;
                
                    },
                    enableInteractiveSelection: true,
                  ),
                  SizedBox(height: 18,),
                  ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                      chatText = "I want to know about ${productNameCont.text}";
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => ChatScreen(
                        title: "Generating a post about ${productNameCont.text}", 
                        chatMessageUpper: chatText)));
                      }
                    }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[800]
                  ),
                  child: Text("Generate",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,)))
                ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}