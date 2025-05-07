

import 'dart:io';

import 'package:chairy_app/Features/cart/domain/entity/cartItemEntity.dart';
import 'package:chairy_app/Features/cart/presentation/cart_screen/logic/cart_cubit.dart';
import 'package:chairy_app/Features/products/domain/entity/productEntity.dart';
import 'package:chairy_app/Features/products/presentation/productsScreen/ui/products.dart';
import 'package:chairy_app/core/Permission/permission_cubit.dart';
import 'package:chairy_app/core/Responsive/ui_component/info_widget.dart';
import 'package:chairy_app/core/helper/extantions.dart';
import 'package:chairy_app/core/shared/widgets/CustomAppbar.dart';
import 'package:chairy_app/core/shared/widgets/cherryToast/CherryToastMsgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Localization/Locales/generated/l10n.dart';
import '../../../../../core/Notifications/Notifications.dart';
import '../../../../../core/helper/dotenv/dot_env_helper.dart';

class productDetails extends StatefulWidget {
  ProductEntity product;
  productDetails({Key? key, required this.product}) : super(key: key);
  @override
  State<productDetails> createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  int quantityToBeAdded = 0;
  bool previousQuantity = false;

  @override
  void initState() {

    List<CartItemEntity?> cartItems = context.read<CartCubit>().cartItems;

    CartItemEntity? existingItem;
    for (var item in cartItems) {
      if (item?.product.id == widget.product.id && item?.product.categories[0].id == widget.product.categories[0].id) {
        existingItem = item;
        break;
      }
    }

    if (existingItem != null) {
      quantityToBeAdded = existingItem.quantity;
      previousQuantity = true;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
       return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CustomAppbar(deviceInfo: deviceInfo, context: context,
          isInHome: false,
          showActionsIcons: false
        ),
         body: BlocListener<PermissionCubit, PermissionState>(listener: (context, state ) async {

           if(state is NotificationPermissionGranted){
             await NotificationService().showNotification(
                 title: S.current.newOrder,
                 body: S.of(context).NotificationBody(quantityToBeAdded, widget.product.title)
             );
           }else if (state is NotificationPermissionDenied){
             await CherryToastMsgs.CherryToastError(info: deviceInfo, context: context, title: S.current.error, description: S.current.notificationPermissionDenied);
           }


         },
         child : BlocConsumer<CartCubit, CartState>(
             listener: (context, state) async {
               if(state is AddedToCartSuccessfully){
                 await CherryToastMsgs.CherryToastSuccess(info: deviceInfo, context: context, title: S.current.success, description: S.current.addedToCartSuccessfully);
                 context.pop();
               }
             },
             builder: (context, state) {
               return Container(
                 margin: EdgeInsetsDirectional.only(top: deviceInfo.screenHeight * 0.02),
                 padding: EdgeInsetsDirectional.only(start: deviceInfo.screenWidth * 0.06, end: deviceInfo.screenWidth * 0.06),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(widget.product.title, style: Theme.of(context).textTheme.bodyMedium!.copyWith( fontWeight: FontWeight.w600, color: Theme.of(context).primaryColor), textAlign: TextAlign.start,),
                     // InkWell(
                     // onTap: (){
                     //   if(quantityToAdd > 0){
                     //     quantityToAdd -= 1;
                     //   context.read<CartCubit>().addQuantity(quantityToAdd);
                     //   }
                     // },
                     //  child:

                     Container(
                       height: deviceInfo.screenHeight * 0.3,

                       decoration: BoxDecoration(
                         color: Theme.of(context).dividerColor,

                       ),

                       child: Stack(
                         clipBehavior: Clip.none,
                         alignment: Alignment.center,
                         children: [
                           Positioned(
                             top: -deviceInfo.screenHeight*0.14,
                             child: Image.network(
                               EnvHelper.getString('BASE_URL')+widget.product.images[0].link,
                               fit: BoxFit.contain,

                               width: deviceInfo.screenWidth * 0.55,
                               height: deviceInfo.screenHeight * 0.55,

                             ),)
                         ],
                       ),
                     ),
                     // ),


                     Row(
                       children: [

                         Text(widget.product.title,style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold, letterSpacing: -1),),

                         Spacer(),

                         Text(widget.product.price.toString(),style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),),

                       ],
                     ),

                     Padding(padding: EdgeInsetsDirectional.only(top: deviceInfo.screenHeight * 0.02),
                       child: Text(widget.product.description,style: Theme.of(context).textTheme.bodyLarge,),
                     ),

                     Spacer(),

                     Row(
                         children: [

                           Row(
                             spacing: deviceInfo.screenWidth * 0.035,
                             children: [
                               SizedBox(
                                 width: deviceInfo.screenWidth * 0.12,
                                 height: deviceInfo.screenHeight * 0.06,
                                 child: ElevatedButton(
                                     onPressed: (){
                                       if(quantityToBeAdded > 0){
                                         quantityToBeAdded -= 1;
                                         context.read<CartCubit>().setQuantityToBeAdded(quantityToBeAdded);
                                       }
                                     }, child: Icon(Icons.remove),
                                     style: ElevatedButton.styleFrom(
                                       padding: EdgeInsets.zero,
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(deviceInfo.screenWidth * 0.1), // Rounded corners
                                         side: BorderSide.none,
                                       ),)
                                 ),
                               ),
                               Text(quantityToBeAdded.toString(),style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),),

                               SizedBox(
                                 width: deviceInfo.screenWidth * 0.12,
                                 height: deviceInfo.screenHeight * 0.06,
                                 child: ElevatedButton(
                                     onPressed: (){
                                       // context.read<CartCubit>().addToCart(product: context.read<ProductsCubit>().Products[index]);

                                       quantityToBeAdded += 1;
                                       context.read<CartCubit>().setQuantityToBeAdded(quantityToBeAdded);
                                     }, child: Icon(Icons.add),
                                     style: ElevatedButton.styleFrom(
                                       padding: EdgeInsets.zero,
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(deviceInfo.screenWidth * 0.1), // Rounded corners
                                         side: BorderSide.none,
                                       ),)
                                 ),
                               ),


                             ],
                           ),
                           Spacer(),

                           Padding(padding: EdgeInsetsDirectional.only(end: deviceInfo.screenWidth * 0.02),
                             child: Text(quantityToBeAdded.toString(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),),

                         ]),


                     Container(
                         margin:EdgeInsetsDirectional.only( top: deviceInfo.screenHeight * 0.02, bottom: deviceInfo.screenHeight * 0.02),
                         width: deviceInfo.screenWidth * 0.9,
                         height: deviceInfo.screenHeight * 0.06,
                         child: ElevatedButton(
                             onPressed: () async {



                               await context.read<PermissionCubit>().requestPermission();

                               context.read<CartCubit>().addToCart(product: widget.product, quantity: quantityToBeAdded);

                             }, child: Text(S.current.addToCart,style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),),
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Theme.of(context).primaryColor,
                               padding: EdgeInsets.zero,)
                         )
                     ),

                   ],
                 ),
               );
             })
         ),
      );
    });
  }
}