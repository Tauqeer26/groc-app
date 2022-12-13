import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_store_app/providers/cart_provider.dart';
import 'package:multi_store_app/widgets/appbar_widgets.dart';
import 'package:multi_store_app/widgets/yellow_button.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  final Widget? back;
  const CartScreen({Key? key, this.back}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: back,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.black,
                  ))
            ],
            elevation: 0,
            backgroundColor: Colors.white,
            title: const AppbarTitle(
              title: 'Cart',
            ),
          ),
          body: Consumer<Cart>(
            builder: (context, cart, child) {
              return ListView.builder(
                  itemCount: cart.count,
                  itemBuilder: ((context, index) {
                    return Card(
                      child: SizedBox(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            
                            children: [
                              SizedBox(
                                height: 100,
                                width: 120,
                                child: Image.network(
                                    cart.getItems[index].imagesUrl.first),
                              ),
                              Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(
                                      cart.getItems[index].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey.shade700),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            cart.getItems[index].price
                                                .toStringAsFixed(2),
                                            style:const  TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                        Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: (){}, 
                                                icon: const Icon(FontAwesomeIcons.plus,
                                                size: 18,
                                                ),
                                                
                                              ),
                                              IconButton(
                                                onPressed: (){}, 
                                                icon: const Icon(FontAwesomeIcons.minus,
                                                size: 18,
                                              ),
                                                
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    
                                ],
                              ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  }));
            },
          ),

          // Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const Text(
          //         'Your Cart Is Empty !',
          //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          //       ),
          //       const SizedBox(
          //         height: 50,
          //       ),
          //       Container(
          //         height: 45,
          //         width: MediaQuery.of(context).size.width * 0.6,
          //         decoration: BoxDecoration(
          //             color: Colors.lightBlueAccent,
          //             borderRadius: BorderRadius.circular(25)),
          //         child: MaterialButton(
          //           minWidth: MediaQuery.of(context).size.width * 0.5,
          //           onPressed: () {
          //             Navigator.canPop(context)
          //                 ? Navigator.pop(context)
          //                 : Navigator.pushReplacementNamed(
          //                     context, '/customer_home');
          //           },
          //           child: const Text(
          //             'Contiue Shopping',
          //             style: TextStyle(fontSize: 18, color: Colors.white),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text(
                      'Total: \$ ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '00.00',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                YellowButton(
                  width: 0.45,
                  label: 'CHECK OUT',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
