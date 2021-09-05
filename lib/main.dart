// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() =>
runApp(MaterialApp(
  title: "MV Zakat App",
  theme: ThemeData(
    // brightness: Brightness.dark,
    primaryColor: Colors.green,
    // accentColor: Colors.white,
    
  ),
  home: zakatCalculator(),
));


class zakatCalculator extends StatefulWidget {
  zakatCalculator({Key? key}) : super(key: key);

  @override
  _zakatCalculatorState createState() => _zakatCalculatorState();
}

class _zakatCalculatorState extends State<zakatCalculator> {
  
  
 num zakatBase = 0;
 num  zakatAmt = 0;
 late num _cashAmt = 0;
 late num _bankAmt = 0;
 late num _dollarCashAmt = 0;
 late num _dollarBankAmt = 0;
 late num _dollarInMVR = 0;


  var cashCont = TextEditingController(text: '0');
  var dollarCashCont = TextEditingController(text: '0');
  var bankCont = TextEditingController(text: '0');
  var dollarBankCont =  TextEditingController(text: '0');


  var nisab = 6878.20;
  var msg = '';

  // const Text( 'Please Enter the values');
    // 'ޢަދަދު ޖައްސަވާފައި ޙިސާބު ކޮށްލައްވާ',
    // textAlign: TextAlign.right,
    // textDirection: TextDirection.rtl
   


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: Colors.green[50],
      
      
//Creating the appbar

       appBar: AppBar(
         backgroundColor: Colors.green,
         title: const Text("MV Zakat App"),
         centerTitle: true,
       ),


       body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(  
             crossAxisAlignment: CrossAxisAlignment.start,
            
             children:  [
       
       //Creating the field for the MVR Cash input
               const Text("Enter your total MVR cash balance",
               style: TextStyle(
                 letterSpacing: 1.5,
                 
               )),
               const SizedBox(height: 1.7),
                TextField(
                  controller: cashCont,
                  keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                   hintText: "Enter Cash balance"
                 ),
               ),
               const SizedBox(height: 24.0),
       
       
       //Creating the field for the MVR bank input
                const Text("Enter your total MVR bank balance",
               style: TextStyle(
                 letterSpacing: 1.5,
                 
               )),
               const SizedBox(height: 1.7),
                TextFormField(
                  controller: bankCont,
                  keyboardType: TextInputType.number,
                  // initialValue: '0',
       
                 decoration: const InputDecoration(
                   hintText: "Enter bank balance",
                  //  filled: true,
                  //  fillColor: Colors.white ,
                  //  hoverColor: Colors.lightGreenAccent,
                  
       
                 ),
               ),
               
       
       //Cash Dollar Values
               const SizedBox(height: 24.0),
               const Text("Enter your total \$ cash balance",
               style: TextStyle(
                 letterSpacing: 1.5,
                 
               )),
               const SizedBox(height: 1.7),
                TextField(
                  controller: dollarCashCont,
                  keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                   hintText: "Enter Dollar Cash balance"
                 ),
               ),

       //Bank Dollar Values
               const SizedBox(height: 24.0),
               const Text("Enter your total \$ bank balance",
               style: TextStyle(
                 letterSpacing: 1.5,
                 
               )),
               const SizedBox(height: 1.7),
                TextField(
                  controller: dollarBankCont,
                  keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                   hintText: "Enter Dollar bank balance"
                 ),
               ),
       
       //Creating the Zakat message
            const SizedBox(height: 24.0),
               Text('$msg',
               style: const TextStyle(
                 letterSpacing: 1.5,
                //  fontFamily: 'FARUMA_',
               ),
              //  textDirection: TextDirection.rtl
               ), 
      
      // Nisab message
      const SizedBox(height: 24.0),
        Text('The Nisab amount set by the Ministry of Islamic Affairs is equal to \nMVR $nisab',
               style: const TextStyle(
                 letterSpacing: 1.5,
                //  fontFamily: 'FARUMA_',
               ),
              //  textDirection: TextDirection.rtl
               ), 
       
       
       //Button
       
              const SizedBox(height: 24.0),
       
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Center(
                     child: ElevatedButton(
                       style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all(Colors.green[300]),
                       ),
       
       //Calculation
                       onPressed: ( ){
                          setState(() {
                              _cashAmt = num.parse(cashCont.text);
                              _bankAmt = num.parse(bankCont.text);
                              _dollarCashAmt = num.parse(dollarCashCont.text) ;
                              _dollarBankAmt = num.parse(dollarBankCont.text) ;
                              _dollarInMVR = (_dollarCashAmt +_dollarBankAmt) * 15.42;
                            
                              
                              zakatBase = _cashAmt + _bankAmt + _dollarInMVR;
                              zakatAmt = (zakatBase / 40);
       
                              if (zakatBase > nisab) {
                                msg =  'The amount required to pay as Zakat is : \nMVR $zakatAmt';
                                  // " ދިވެހި ރުފިޔާ $zakatAmt ޒަކާތުގެ ގޮތުގައި ދައްކަން ޖެހޭ ޢަދަދަކީ ",
                                  // textAlign: TextAlign.right,
                                  // textDirection: TextDirection.rtl);
                              }
                              else {
                                msg =
                                  'Your Zakatable wealth is below Nisab which is \nMVR $nisab';
                                //   'ޢަދަދު ޖައްސަވާފައި ޙިސާބު ކޮށްލައްވާ',
                                //   textAlign: TextAlign.right,
                                // textDirection: TextDirection.rtl);
                              }
            
          });
       
                     },
                      child: const Text("Calculate")),
                     ),
       
       //Button 2 to clear all
                   ElevatedButton(
                     style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all(Colors.grey[400]),
                       ),
                    onPressed: (){
                      setState(() {
                      cashCont = TextEditingController(text: '0');
                      dollarCashCont = TextEditingController(text: '0');
                      bankCont = TextEditingController(text: '0');  
                      dollarBankCont =  TextEditingController(text: '0');
                      msg = '';
                      });
                      
       
                    },
                    child: const Text("Start Again"))
                 ],
               ),
               
                 
                                   
               ],
              
           ),
         ),
       ),
    );
  }
}