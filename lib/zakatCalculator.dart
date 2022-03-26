import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class zakatCalculator extends StatefulWidget {
  zakatCalculator({Key? key}) : super(key: key);

  @override
  _zakatCalculatorState createState() => _zakatCalculatorState();
}

class _zakatCalculatorState extends State<zakatCalculator> {
  
  
 late num zakatBase = 0;
 late num zakatAmt = 0;

  num _cashAmt = 0;
 late num _bankAmt = 0;

 late num _dollarCashAmt = 0;
 late num _dollarBankAmt = 0;
 late num _dollarInMVR = 0;

//  late num _inrCashAmt =0;
//  late num _inrInMVR = 0;

//  late num _lkrCashAmt =0;
//  late num _lkrInMVR = 0;

 late num _otherInMVR = 0;

late num _commercialValue = 0;
late num _goldSavings = 0;
late num _silverSavings = 0;
late num _sharesforTrading =0;


//cash controllers
  var cashCont  = TextEditingController( text: '0');
  var dollarCashCont = TextEditingController(text: '0');
  var bankCont = TextEditingController(text: '0');
  var dollarBankCont =  TextEditingController(text: '0');
  var otherInMVRCont =  TextEditingController(text: '0');

// other controllers

  var commercialCont =  TextEditingController(text: '0');
  var goldCont =  TextEditingController(text: '0');
  var silverCont =  TextEditingController(text: '0');
  var sharesCont =  TextEditingController(text: '0');
  

  // sets nisab level and message variable
  var nisab = 7241.15;
  var msg = '';

  // const Text( 'Please Enter the values');
    // 'ޢަދަދު ޖައްސަވާފައި ޙިސާބު ކޮށްލައްވާ',
    // textAlign: TextAlign.right,
    // textDirection: TextDirection.rtl
   
final _formKey = GlobalKey<FormState>();

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

       //Gold savings Values
               const SizedBox(height: 24.0),
               const Text("Gold Savings value in MVR based on 24K",
               style: TextStyle(
                 letterSpacing: 1.5,
                 
               )),
               const SizedBox(height: 1.7),
                TextField(
                  controller: goldCont,
                  keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                   hintText: "Total of the Gold Savings in MVR"
                 ),
               ),

        //Silver savings Values
               const SizedBox(height: 24.0),
               const Text("Silver Savings value in MVR based on 24K",
               style: TextStyle(
                 letterSpacing: 1.5,
                 
               )),
               const SizedBox(height: 1.7),
                TextField(
                  controller: silverCont,
                  keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                   hintText: "Total of the Silver Savings in MVR"
                 ),
               ),

       //Creating the field for the MVR Cash input
                const SizedBox(height: 24.0),
               const Text("Enter your total MVR cash balance",
               style: TextStyle(
                 letterSpacing: 1.5,
                 
               )),
               const SizedBox(height: 1.7),
                TextField(
                  controller: cashCont,
                  keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                   hintText: "Enter Cash balance",
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
                  // initialValue: 'null',
                validator: (value) {
    if (bankCont.text.isEmpty) {
       bankCont = TextEditingController(text: '0');
    }
    return null;
  },
                //   validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     bankCont = TextEditingController(text: '0');
                //   }
                //   return null;
                // },
       
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

       //Cash Other currency Values
               const SizedBox(height: 24.0),
               const Text("If you have other currencies, please convert to MVR and Enter here",
               style: TextStyle(
                 letterSpacing: 1.5,
                 
               )),
               const SizedBox(height: 1.7),
                TextField(
                  controller: otherInMVRCont,
                  keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                   hintText: "Total of other currencies you have in MVR"
                 ),
               ),

       //Cash Commercial Values
               const SizedBox(height: 24.0),
               const Text("Enter the commerical value of trade stocks",
               style: TextStyle(
                 letterSpacing: 1.5,
                 
               )),
               const SizedBox(height: 1.7),
                TextField(
                  controller: commercialCont,
                  keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                   hintText: "If you have a business, enter the stock value"
                 ),
               ),
      
       //Cash Stock Values
               const SizedBox(height: 24.0),
               const Text("Enter the market value of the shares of stockmaket owned for trading purpose",
               style: TextStyle(
                 letterSpacing: 1.5,
                 
               )),
               const SizedBox(height: 1.7),
                TextField(
                  controller: sharesCont,
                  keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                   hintText: "Total of shares market value used for trading purpose"
                 ),
               ),
               
       
       //Creating the Zakat message
            const SizedBox(height: 24.0),
               SizedBox(
                 width: double.infinity,
                 child: Text('$msg',
                 textAlign: TextAlign.right,
                 textDirection: TextDirection.rtl,
                 style: const TextStyle(
                     letterSpacing: 1.5,
                   fontFamily: 'faruma',
                 ),
              //  textDirection: TextDirection.rtl
                 ),
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
                       //  cashCont = TextEditingController(text: '0');
                        //  if (cashCont == " ") {
                        //    setState(() {
                        //      cashCont = TextEditingController(text: '0');
                            
                        //       // print (cashCont);
                            
                        //    });
                           
                        //  } 
                        //  _cashAmt = num.parse(cashCont.text);

                          setState(() {
                       
                             
                              //  cashCont ??= TextEditingController(text: '0');  _cashAmt = num.parse(cashCont.text);

                              // _cashAmt = num.parse(cashCont.text);
                              // if (cashCont.text.isEmpty) {
                              //       cashCont = TextEditingController(text: '0');
                              //     }
                              //     // return null;
                              //     _cashAmt = num.parse(cashCont.text);
                              //   };
                              _cashAmt = num.parse(cashCont.text);
                              _bankAmt = num.parse(bankCont.text);
                              _dollarCashAmt = num.parse(dollarCashCont.text) ;
                              _dollarBankAmt = num.parse(dollarBankCont.text) ;
                              _dollarInMVR = (_dollarCashAmt +_dollarBankAmt) * 15.42;
                              _otherInMVR = num.parse(otherInMVRCont.text);
                              _commercialValue= num.parse(commercialCont.text);
                              _goldSavings = num.parse(goldCont.text);
                              _silverSavings = num.parse(silverCont.text);
                              _sharesforTrading = num.parse(sharesCont.text);
                           
                              
                              zakatBase = _cashAmt +_bankAmt + _dollarInMVR + _otherInMVR +_commercialValue + _goldSavings + _silverSavings + _sharesforTrading;

                              zakatAmt = (zakatBase / 40);
       
                              if (zakatBase > nisab) {
                                msg =  
                                // 'The amount required to pay as Zakat is : \nMVR $zakatAmt';
                                  ' ޒަކާތުގެ ގޮތުގައި ދައްކަން ޖެހޭ ޢަދަދަކީ  $zakatAmt ދިވެހި ރުފިޔާ';
                                  // " ދިވެހި ރުފިޔާ $zakatAmt ޒަކާތުގެ ގޮތުގައި ދައްކަން ޖެހޭ ޢަދަދަކީ ",
                                  // textAlign: TextAlign.right,
                                  // textDirection: TextDirection.rtl);
                              }
                              else {
                                msg =
                                //  'Your Zakatable wealth $zakatBase is below Nisab which is \nMVR $nisab'; 
                                  'ތިފަރާތުގެ މިލްކިއްޔާތުގެ ތެރޭން ޒަކާތް ހިސާބު ކުރެވޭ މިލްކިއްޔާތުގެ ޖުމްލައަކީ  $zakatBase ރުފިޔާ، ނަމަވެސް ނިސާބުގެ މިންވަރަކީ  $nisab ރުފިޔާ ';
                                //   'ޢަދަދު ޖައްސަވާފައި ޙިސާބު ކޮށްލައްވާ',
                                //   textAlign: TextAlign.right,
                                // textDirection: TextDirection.rtl);
                              }
            
          }
          );
       
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
                      commercialCont =  TextEditingController(text: '0');
                      goldCont =  TextEditingController(text: '0');
                      silverCont =  TextEditingController(text: '0');
                      sharesCont =  TextEditingController(text: '0');
                      otherInMVRCont =  TextEditingController(text: '0');
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