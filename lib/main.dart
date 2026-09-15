import 'package:flutter/material.dart';

const List<String> improvatines =['Πανος', 'Στελλα', 'Κωστας', 'Χρυσακης', 'Γιαννης Γ', 'Νικος',
'Μακος', 'Σταυρος', 'Βασιλης', 'Χριστινα Ρ', 'Ντεμι', 'Μυρτω', 'Πιστη', 'Γαβριηλ', 'Άλεξ', 'Ντακος',
'Ζακλιν', 'Μιλτος', 'Άννα', 'Δημητρης Π', 'Λευκος', 'Τζενη Τζενη', 'Τζο', 'Γιαννης Τ', 'Τζοτζο', 'Χαρης',
'Κωννα', 'Δαναη', 'Χριστινα Μ', 'Δημητρης Φ', 'Γιωργος', 'Μαρια', 'Βαλεντινη', 'Δεν Ειπωθηκε Ποτε'];

void main() => runApp(MaterialApp(
  home: Atakes(),
));

class Atakes extends StatefulWidget {
  const Atakes({super.key});

  @override
  State<Atakes> createState() => _AtakesState();
}

class _AtakesState extends State<Atakes> {
  String dropdownValue = improvatines.first;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 16, 63), 
      appBar: AppBar(
        toolbarHeight: 155,
        title: SizedBox(
          height: 155,
          child: Image.asset('assets/Improvatines_Quiz_Night_logo-removebg-preview.png'),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 16, 63),
      ), 
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(30, 60, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Ποιά Ιμπροβατίνα είπε',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 2,
                    fontFamily: 'ComicRelief'
                  ),
                ),
              ),
              SizedBox(height: 2),
              Center(
                child: Text(
                  'τις Ατάκες Τσέπης;;;;',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 2,
                    fontFamily: 'ComicRelief'
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: DropdownButton<String>(
                  items: improvatines.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: TextStyle(
                    color: Colors.amber,
                    fontFamily: 'ComicRelief'
                  ),
                  underline: Container(height: 2, color: Colors.white),
                  alignment: AlignmentDirectional.center,
                  onChanged: (String? value){
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: OutlinedButton(
                  onPressed: () => _dialogbuilder(context, dropdownValue),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 1, 16, 63)
                  ),                
                  child: Text(
                    'Ψήφισε',
                    style: TextStyle(
                      color: Colors.amber,
                      fontFamily: 'ComicRelief'
                    ),
                  ),
                ),
              )  
            ],
          ),
        ),
      )
    );
  }
}

Future<void> _dialogbuilder(BuildContext context, String data){
  return showDialog<void>(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 1, 16, 63),
        content: Text(
          data.toUpperCase(),
          style: TextStyle(
            color: Colors.amber,
            fontFamily: 'ComicRelief',
            fontSize: 50,
            letterSpacing: 2
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge
            ),
            child: Text(
              'Πίσω',
              style: TextStyle(
                color: Colors.amber,
                fontFamily: 'ComicRelief'
              ),              
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      );
    }
  );
}