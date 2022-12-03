import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mykeypad_flutter/KeyboardKey.dart';

class CustomKeyboard extends StatefulWidget {
  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  late List<List<dynamic>> keys;
  String? amount;

  @override
  void initState() {
    super.initState();

    keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['00', '0', Icon(Icons.keyboard_backspace)]
    ];
    amount = '';
  }

 onKeyTap(val){
    // if(amount?.length ==0 && val == '00'){
    //   return;
    // }

    setState(() {
      amount = amount! + val;
    });
 }

  onBackspacePress(val){
    if(amount?.length == 0){
      return;
    }

    setState(() {
      amount = amount?.substring(0, amount!.length - 1);
    });
  }


  renderKeyboard() {
    return keys
        .map(
          (x) => Row(
            children: x.map(
              (y) {
                return Expanded(
                  child: KeyboardKey(
                    label: y,
                    value: y,
                    onTap: (val) {
                      if(val is Widget){
                        onBackspacePress(val);
                      }else{
                        onKeyTap(val);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
        )
        .toList();
  }

  renderAmount() {
    String display = '보낼금액';
    TextStyle style = TextStyle(
        color: Colors.grey,
        fontSize: 30.0,
        fontWeight: FontWeight.bold);

    if(this.amount!.length > 0) {
      //NumberFormat f = NumberFormat('#,###');
      display = amount! + '원';
      style = style.copyWith(color: Colors.black,);
    }

    return Center(
      child: Text(
        display,
        style: style,
      ),
    );
  }

  renderConfirmButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              //color: Colors.orange,
              decoration: BoxDecoration(
                  //color: Colors.orange,
                  ),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text(
                    '확인',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            renderAmount(),
            ...renderKeyboard(),
            renderConfirmButton(),
          ],
        ),
      ),
    );
  }
}
