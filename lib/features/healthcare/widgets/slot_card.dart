import 'package:flutter/material.dart';
import 'package:vit_connect_plus/features/lost_and_found/screens/lost_and_found_screen.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';

class SlotCard extends StatefulWidget {
  final int slotIndex;
final ValueChanged<int> onSelected;

  const SlotCard({Key? key, required this.onSelected, required this.slotIndex}) : super(key: key);

  @override
  _SlotCardState createState() => _SlotCardState();
}

class _SlotCardState extends State<SlotCard> {
  bool isSelected = false;
  int get slot => widget.slotIndex;
  int? nextSlot;
  @override
  void initState() {
    super.initState();
    nextSlot = slot + 1;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });

        if(isSelected){
          widget.onSelected(slot);
      }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  isSelected ? Colors.white : MyColors.primary.withOpacity(0.7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(24),
            color:
                isSelected ? MyColors.primary.withOpacity(0.7) : Colors.white,
          ),
          width: 120,
          height: 50,
          child: Center(
            child: Text(
              isSelected ? "$slot:00-$nextSlot:00" : "$slot:00-$nextSlot:00",
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
