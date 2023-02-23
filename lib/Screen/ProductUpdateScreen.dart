import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestAPI/Restclint.dart';
import '../Style/Style.dart';
import 'ProductGridViewScreen.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Map ProductItem;
  const ProductUpdateScreen( this.ProductItem) ;

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  Map<String,String> Formvalus={"Img":"", "ProductCode":"", "ProductName":"", "Qty":"", "TotalPrice":"", "UnitPrice":""};
  bool Loading=false;

  @override
  void initState(){
    setState(() {
      Formvalus.update("Img", (value) => widget.ProductItem['Img']);
      Formvalus.update("ProductCode", (value) => widget.ProductItem['ProductCode']);
      Formvalus.update("ProductName", (value) => widget.ProductItem['ProductName']);
      Formvalus.update("Qty", (value) => widget.ProductItem['Qty']);
      Formvalus.update("TotalPrice", (value) => widget.ProductItem['TotalPrice']);
      Formvalus.update("UnitPrice", (value) => widget.ProductItem['UnitPrice']);

    });

  }

  InputOnChange(MapKey,Textvalue){
    setState(() {
      Formvalus.update(MapKey, (value) => Textvalue);
    });

  }

  FormOnSubmit() async {
    if (Formvalus['Img']!.length == 0) {

      ErrorToast('Image Link Requried !');

    }
    else if(Formvalus['ProductCode']!.length==0){
      ErrorToast('Product Code Requried !');

    }

    else if(Formvalus['ProductName']!.length==0){

      ErrorToast('Product Name Requried !');

    }
    else if(Formvalus['Qty']!.length==0){

      ErrorToast('Product Qty Requried !');

    }
    else if(Formvalus['TotalPrice']!.length==0){

      ErrorToast('Product Price Requried !');

    }
    else if(Formvalus['UnitPrice']!.length==0){

      ErrorToast('Product Unite Price Requried !');

    }
    else{
      setState(() {
        Loading=true;
      });
      //process start

      await ProductUpdateRquest(Formvalus, widget.ProductItem['_id']);// product Update....

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context)=> ProductGridViewScreen()),
          (Route route)=> false
      );

      //data rest api....
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Product"),
      ),
      body: Stack(
        children: [

          ScreenBackground(context),
          //Background Graphices
          Container(
              child: Loading?(Center(
                child: CircularProgressIndicator(),
              )):(
                  (SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                           initialValue:Formvalus['ProductName'],

                          onChanged: (Textvalue){

                          InputOnChange("ProductName",Textvalue);
                        },
                          decoration: AppInputDecoration('Product Name'),
                        ),
                        SizedBox(height: 20,),

                        TextFormField(
                          initialValue:Formvalus['ProductCode'],
                          onChanged: (Textvalue){

                          InputOnChange("ProductCode",Textvalue);
                        },
                          decoration: AppInputDecoration('Product Code'),
                        ),
                        SizedBox(height: 20,),

                        TextFormField(
                          initialValue:Formvalus['Img'],
                          onChanged: (Textvalue){

                          InputOnChange("Img",Textvalue);
                        },
                          decoration: AppInputDecoration('Product Image'),
                        ),
                        SizedBox(height: 20,),

                        TextFormField(
                          initialValue:Formvalus['UnitPrice'],
                          onChanged: (Textvalue){
                          InputOnChange("UnitPrice",Textvalue);

                        },decoration: AppInputDecoration('Unite Prize'),
                        ),
                        SizedBox(height: 20,),

                        TextFormField(
                          initialValue:Formvalus['TotalPrice '],
                          onChanged: (Textvalue){

                          InputOnChange("TotalPrice",Textvalue);

                        },decoration: AppInputDecoration('Total Prize'),
                        ),
                        SizedBox(height: 20,),

                        AppDropdwonStyle(
                          DropdownButton(
                            value: Formvalus['Qty'],
                            items: [
                              DropdownMenuItem(child:Text('Select QT'),value: "",),
                              DropdownMenuItem(child:Text('1 pcs') ,value: "1 pcs",),
                              DropdownMenuItem(child:Text('2 pcs') ,value: '2 pcs',),
                              DropdownMenuItem(child:Text('3 pcs') ,value: '3 pcs',),
                              DropdownMenuItem(child:Text('4 pcs') ,value: '4 pcs',),

                            ],
                            onChanged: (Textvalue){
                              InputOnChange("Qty",Textvalue);
                            },

                            underline: Container(),
                            isExpanded: true,
                          ),
                        ),
                        SizedBox(height: 20,),

                        Container(
                          child:  ElevatedButton(onPressed: (){
                            FormOnSubmit();
                          },
                            child: SuccessButtonChild('Submit'),
                            style: AppButtonStyle(),),
                        )



                      ],
                    ),
                  ))
              )

          )
        ],
      ),
    );
  }
}
