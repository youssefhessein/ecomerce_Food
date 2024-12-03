import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce2/Screens/models/Cubit_State_Product_Model.dart';
import 'package:flutter_ecomerce2/Screens/models/Cubit_product_model.dart';
import 'models/productmodel.dart';

class DetailsProduct extends StatefulWidget {

  final Product product ;

  const DetailsProduct({super.key, required this.product});


  @override
  State<DetailsProduct> createState() => _DetailsProductState();

}

class _DetailsProductState extends State<DetailsProduct> {
  List<Product>  product = [] ;
  late int _counter = 0;  // عداد البداية
 void initState(){
   super.initState();
   _counter = widget.product.quantity;
 }
  void _incrementCounter() {
    setState(() {
      _counter++;
      widget.product.quantity=_counter ;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
        widget.product.quantity =_counter ;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    ModelCubit cubit = ModelCubit.get(context);
    return BlocBuilder<ModelCubit , ModelState>(builder: (BuildContext context, state) {
    return  Scaffold(
          appBar: AppBar(
            actions: [
               const SizedBox(width: 260),
              IconButton(onPressed: () {
                setState(() {
                  cubit.toggleFavorite(widget.product);
                });
              }, icon: Icon(
                cubit.isFavorite(widget.product) ?
                    Icons.favorite :
                Icons.favorite_border_outlined ,
                color: cubit.isFavorite(widget.product) ? Colors.red : null,
              )
              )
            ]
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      widget.product.image,
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _decrementCounter();
                        },
                        icon: const Icon(Icons.remove_circle),
                      ),
                      Text('$_counter'),
                      IconButton(
                        onPressed: () {
                          _incrementCounter();
                        },
                        icon: const Icon(Icons.add_circle),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Price' , style: TextStyle(color: Colors.grey , fontSize: 5),),
                      const SizedBox(height: 3),
                      Text(
                        '\$${widget.product.price}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '\$${widget.product.oldPrice}',
                        style: const TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            //  borderRadius: BorderRadius.circular(30),
                            color: Colors.white ,
                            shape: BoxShape.circle ,
                          ),

                          child: IconButton(onPressed: (){
                            setState(() {
                              cubit.addToCart(widget.product);
                            });
                          }, icon: const Icon(Icons.shopping_cart_sharp , color: Colors.black,))
                      ),
                    ],
                  ),
                ]
            ),
          )
      );
    },

    );
  }
}
