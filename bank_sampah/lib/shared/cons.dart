import 'package:flutter/material.dart';

class Cartsampah extends StatefulWidget {
  final String title;
  final String imageas;
  final void Function() ontap;
  const Cartsampah({super.key,required this.title,required this.imageas,required this.ontap});
  

  @override
  State<Cartsampah> createState() => _CartsampahState();
}

class _CartsampahState extends State<Cartsampah> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        
        height: 150,
        width: 150,
        child: Card(
          elevation: 0.0,
          color: Colors.transparent,
          child: Column(
            children: [
              Container(
                height: 120,
                width:150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)
                  ),
                  border: Border.all(color: Colors.green),
                  image: DecorationImage(
                    image: AssetImage(widget.imageas),
                    fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                width: 150,
                child: Center(child: Text(widget.title, style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)
                  ),
                  border: Border.all(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
