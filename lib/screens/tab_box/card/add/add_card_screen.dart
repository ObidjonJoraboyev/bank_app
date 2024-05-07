import 'package:banking_app/blocs/card/user_card_bloc.dart';
import 'package:banking_app/blocs/card/user_card_event.dart';
import 'package:banking_app/blocs/card/user_card_state.dart';
import 'package:banking_app/data/models/card_model.dart';
import 'package:banking_app/screens/tab_box/profile/update/widgets/textfield_items.dart';
import 'package:banking_app/utils/app_colors.dart';
import 'package:banking_app/utils/formatters.dart';
import 'package:banking_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  Color color = const Color(0xFF8225F9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF121433),
      appBar: AppBar(
        leading: const Icon(Icons.add, color: Colors.transparent),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Add new card",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.w,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: BlocConsumer<UserCardsBloc, UserCardsState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: color,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "VISA",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 36.w,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Platinum",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        ".... .... .... ....",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 24.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                24.getH(),
                Text(
                  "Card Color",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.w,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                12.getH(),
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        color = const Color(0xFF2567F9);
                        setState(() {});
                      },
                      child: Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2567F9),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    12.getW(),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        color = const Color(0xFF8225F9);
                        setState(() {});
                      },
                      child: Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF8225F9),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    12.getW(),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        color = const Color(0xFFFFB017);
                        setState(() {});
                      },
                      child: Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFB017),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
                32.getH(),
                Text(
                  "Card Number",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.w,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                16.getH(),
                TextFieldItems(
                  maskTextInputFormatter:
                      AppInputFormatters.cardNumberFormatter,
                  controller: cardNumberController,
                  hintText: "Card Number",
                ),
                15.getH(),
                Text(
                  "Username",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.w,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                16.getH(),
                TextFieldItems(
                  controller: nameController,
                  hintText: "Name",
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF2567F9),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      List<CardModel> db = state.userCardsDB;
                      List<CardModel> myCards = state.userCards;

                      bool isExist = false;

                      for (var element in myCards) {
                        if (element.cardNumber.trim() ==
                            cardNumberController.text) {
                          isExist = true;
                          break;
                        }
                      }
                      CardModel? cardModel;
                      bool hasInDB = false;

                      for (var element in db) {
                        if (element.cardNumber.trim() ==
                            cardNumberController.text) {
                          hasInDB = true;
                          cardModel = element;
                          break;
                        }
                      }

                      if ((!isExist) && hasInDB) {
                        context.read<UserCardsBloc>().add(
                              AddCardEvent(
                                cardModel: cardModel!,
                              ),
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Karta qo'shilgan yoki bazada mavjud emas!",
                              style: TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.w,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                24.getH(),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.w,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                20.getH(),
              ],
            ),
          );
        },
        listener: (BuildContext context, UserCardsState state) {
          if (state.statusMessage == "added") {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
