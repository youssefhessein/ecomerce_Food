import 'package:flutter/material.dart';
import 'package:flutter_ecomerce2/Screens/models/Cubit_product_model.dart';

import 'models/productmodel.dart';



class CartScreen extends StatefulWidget {
  final Product? product ;

   CartScreen({super.key, this.product,} ) ;


  @override
  State<CartScreen> createState() => _CartScreenState();
  List<Product> products = [] ;
  List<Product> cart = [] ;
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    ModelCubit cubit = ModelCubit.get(context) ;
    return Scaffold(
      appBar: AppBar(
      title: const Text('Cart'),
    ),
      body: Column(
          children: [
            Expanded(child:GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                shrinkWrap: true,
                itemCount: widget.cart.length,
                itemBuilder: (context , index) {
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   child: Image.asset(
                  //     widget.product!.image,
                  //     height: 100,
                  //     width: 100,
                  //     fit: BoxFit.contain,
                  //   ),
                  // );
                  return  ListView.builder(
                      itemCount: widget.cart.length,
                      itemBuilder: (context , index) {
                        final product = widget.cart[index] ;
                        return ListTile(
                          leading: Image.asset(widget.product!.image , width: 50, height: 50,),
                          title: Text('${product.name} x${product.quantity}'),
                          subtitle: Text('Price ${product.price}${product.quantity}'),
                          trailing: IconButton(onPressed: (){
                            setState(() {
                              cubit.removeFromCart(product);
                            });
                          }, icon: const Icon(Icons.delete ,
                            color: Colors.red,)),
                        );
                      });
                }) )

          ],
        ),
      );
  }
}
// class Screen extends StatefulWidget {
//   const Screen({super.key});
//
//   @override
//   State<Screen> createState() => _ScreenState();
// }
//
// class _ScreenState extends State<Screen> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cart'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cart.length,
//               itemBuilder: (context, index) {
//                 final product = cart[index];
//                 return ListTile(
//                   title: Text('${product.name} x${product.quantity}'),
//                   subtitle: Text('Price: \$${(product.price * product.quantity).toStringAsFixed(2)}'),
//                   trailing: IconButton(
//                     icon: const Icon(Icons.delete),
//                     onPressed: () {
//                       setState(() {
//                         cart.removeAt(index);
//                       });
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//           // الزر المثبت أسفل الشاشة
//           Container(
//             padding: const EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total: \$${ calculateTotalPrice().toStringAsFixed(2)}',
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // يمكنك إضافة نافذة لتأكيد الطلب
//                     showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         title: const Text('Order Confirmation'),
//                         content: Text('Your total is \$${calculateTotalPrice().toStringAsFixed(2)}. Proceed?'),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context); // إغلاق النافذة
//                             },
//                             child: const Text('Cancel'),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               // إجراء بعد تأكيد الطلب
//                               setState(() {
//                                 cart.clear(); // مسح الكارت بعد الطلب
//                               });
//                               Navigator.pop(context);
//                             },
//                             child: const Text('Confirm'),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                   child: const Text('Checkout'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
