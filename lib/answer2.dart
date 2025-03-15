import 'package:flutter/material.dart';

class Answer2 extends StatefulWidget {
  const Answer2({super.key});

  @override
  State<Answer2> createState() => _Answer2State();
}

class _Answer2State extends State<Answer2> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedItem = 'ในเมือง';
  bool? isChecked_1 = false;
  bool? isChecked_2 = false;
  bool resultBar = false;
  String? _howFastSend = 'normal';
  double _cost = 0;
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  dynamic calculate(double weight) {
    setState(() {
      if (_selectedItem == 'ในเมือง') {
        _cost = weight * 10;
      } else if (_selectedItem == 'ต่างจังหวัด') {
        _cost = weight * 15;
      } else if (_selectedItem == 'ต่างประเทศ') {
        _cost = weight * 50;
      }

      if (isChecked_1 == true) {
        _cost = _cost + 20;
      }
      if (isChecked_2 == true) {
        _cost = _cost + 50;
      }

      if (_howFastSend == 'normal') {
        _cost += 0;
      } else if (_howFastSend == 'fast') {
        _cost += 30;
      } else if (_howFastSend == 'superFast') {
        _cost += 50;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('คำนวณค่าจัดส่ง')),
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(25),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _weightController,
                    decoration:
                        const InputDecoration(labelText: 'น้ำหนักสินค้า (กก):'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'โปรดกรอกน้ำหนักสินค้า';
                      }
                      return null;
                    },
                    onChanged: (value) => print(value),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('เลือกระยะทาง'),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedItem,
                    items: ['ในเมือง', 'ต่างจังหวัด', 'ต่างประเทศ']
                        .map((item) =>
                            DropdownMenuItem(value: item, child: Text(item)))
                        .toList(),
                    onChanged: (value) {
                      _selectedItem = value;
                    },
                    validator: (value) =>
                        value == null ? 'Please select an option' : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('บริการเสริม'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text("แพ็คกิ้งพิเศษ (+20 บาท)")
                        ],
                      ),
                      Checkbox(
                        value: isChecked_1,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked_1 = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text("ประกันพัสดุ (+50 บาท)")
                        ],
                      ),
                      Checkbox(
                        value: isChecked_2,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked_2 = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('เลือกความเร่งด่วน :'),
                  SizedBox(
                    height: 10,
                  ),
                  RadioListTile(
                      title: const Text('ปกติ'),
                      value: 'normal',
                      groupValue: _howFastSend,
                      onChanged: (value) => setState(() {
                            _howFastSend = value.toString();
                          })),
                  RadioListTile(
                      title: const Text('ด่วน'),
                      value: 'fast',
                      groupValue: _howFastSend,
                      onChanged: (value) => setState(() {
                            _howFastSend = value.toString();
                          })),
                  RadioListTile(
                      title: const Text('ด่วนพิเศษ'),
                      value: 'superFast',
                      groupValue: _howFastSend,
                      onChanged: (value) => setState(() {
                            _howFastSend = value.toString();
                          })),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            calculate(double.parse(_weightController.text));
                            setState(() {
                              resultBar = true;
                            });
                          }
                        },
                        child: Text('คำนวณราคา')),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  resultBar
                      ? Center(
                          child: (Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.yellow[50]),
                            child: Text('ค่าจัดส่งทั้งหมด ${_cost} บาท'),
                          )),
                        )
                      : SizedBox(
                          height: 0,
                        )
                ],
              ))),
    );
  }
}
