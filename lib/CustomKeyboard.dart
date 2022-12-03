import 'package:flutter/material.dart';
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
    setState(() {
      amount = amount! + val;
    });
 }

  onBackspacePress(val){
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
    return Center(
      child: Text(
        '보낼금액',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,

        ),
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
