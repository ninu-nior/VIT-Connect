import 'package:flutter/material.dart';
import 'package:vit_connect_plus/features/home/screens/mon.dart';

class MessMenuScreen extends StatelessWidget {
  const MessMenuScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 12),
            tabs: [
              Tab(text: "Mon"),
              Tab(text: "Tue"),
              Tab(text: "Wed"),
              Tab(text: "Thu"),
              Tab(text: "Fri"),
              Tab(text: "Sat"),
              Tab(text: "Sun"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Widgets for Monday
            Mon(
              breakfast:
                  "ALOO-GOBHI PARATHA ,VEG KICHIDI,EGG-BHURJI(INDIAN STYLE),MUSKMELON JUICE, CHOCOS, BBJ,TMC,SPROUTS WITH ONION AND LEMON,VADA, COCONUT CHUTNEY",
              lunch:
                  "BISIBELEBATH, RAJMA CURRY ,RICE,JEERA- RASAM,PHULKA, POTATO CHIPS,RICE PAYASAM, BUTTERMILK, CURD, SALAD(TOMATO, CUCUMBER, ONIONS, CARROT), CABBAGE PORIYAL, podi, ghee",
              snacks: "BOILED SWEET CORN, TOMATO, BUTTER, ONION, LEMON, TMC",
              dinner:
                  "LACHA PAROTHA ,ADRAKI MURGH(CHICKEN)/CHETTINAD PEPPER CHICKEN, PANEER CURRY DHABA STYLE, RICE,RASAM, BUTTER MILK, VEG SOUP, FRUIT SALAD, ICE CREAM",
            ),
            // Widgets for Tuesday
            Mon(
                breakfast:
                    "PONGAL,OMELLETE WITH SPICE ,SAMBAR,MEDU VADA,CHUTNEY,CHOCOS,TMC,BBJ,MOSAMBI JUICE,BOILED SPROUTS WITH ONION AND LEMON, CUCUMBER AND TOMATO, SEMIYA UPMA",
                lunch:
                    "ACHARI PANEER,BUTTER- PHULKA, JEERA RICE, RICE,PARUPPU RASAM, BUTTER MILK,CARROT PORIYAL, KARAKOZHMBU, SALAD, PAPAD, CURD",
                snacks: "MACARONI/ HAKKA NOODLES, TOMATO KETCHUP, TMC",
                dinner:
                    "PHULKA,DAAL TADKA, VEG BRINJI, RICE, RASAM,CURD, STRAWBERRY MILK, THIN DOSA ,ONION CHUTNEY,WATERMELON, MANCHOW SOUP(FRIED NOODLES), PAPAD, AAMRAS"),
            // Widgets for Wednesday
            Mon(
                breakfast:
                    "GHEE SOOJI UPMA WITH CARROT AND BEANS,SAMBAR, POORI AND MASALA , PICKLE, CHOCOS, TMC, BBJ, ORANGE JUICE, OMELETTE, CURD",
                lunch:
                    "TRAVANCORE CHICKEN ROAST/CHICKEN 65, RICE, KADAI MUSHROOM, JEERA ARBI, LEMON RASAM, CURD,PARPPU PODI,GHEE, LEMON JUICE, SEMIYA PAYASAM, SALAD(TOMATO, CUCUMBER, ONIONS, CARROT)",
                snacks:
                    "VEG PUFFS/BREAD ROLLS WITH GREEN CHUTNEY AND TOMATO KETCHUP, TMC",
                dinner:
                    "ONION GHEE RICE, EGG  ROAST ,IDLI, MINT CHUTNEY,BINDI MASALARICE,RASAM,PHULKA ,SWEET CORN SOUP,CARROT HALWA, SAMBAR, BUTTER MILK, BANANA")
            // Widgets for Thursday
            ,
            Mon(
              breakfast:
                  "IDIYAPPAM,VADA,COCONUT MILK, CHOCOS, PINEAPPLE JUICE,BBJ,TMC,SPROUTS WITH ONION AND LEMON,CUCUMBER,TOMATO, FRENCH TOAST",
              lunch:
                  "PHULKA,VEGETABLE PULOA,SOYACURRY, DAL TADKA,  RICE,RASAM,CARROT, CUCUMBER ,BEETROOT PORIYAL,PAPPAD,PARPPU  CURD, FRYUMS,  BUTTERMILK",
              snacks:
                  "DAHI PURI WITH SEV, CHOPPED ONIONS/ MASALA PURI WITH CHOPPED ONIONS,SEV,CORN CHIP , TMC",
              dinner:
                  "CHOLE BATURE,RICE,RASAM, CARROT DOSA,SAMBAR, COCONUT CHUTNEY,MUSHROOM SOUP,BLACK DAL, PINEAPPLE, LEMON AND ONION, BADAM MILK",
            ),
            Mon(
                breakfast:
                    "PAV BHAJI, SABUDHANA KICHIDI, PARUPPU VADA, CHOCOS,BBJ,TMC,  POMOGRANATE JUICE,BOILED SPROUTS WITH ONION AND LEMON, PODI, SCRAMBLED EGGS",
                lunch:
                    "PANEER BUTTER MASALA, PHULKA ,RICE,PEPPER RASAM,RAW MANGO SAMBHAR, BAINGAN BHARTA,KESARI, LEMON RICE,PARUPPU PODI,GHEE, CURD,LEMON JUICE,CUCUMBER,POTATO CHIPS",
                snacks: "DRY CAKE/CREAM CAKE, TMC ",
                dinner:
                    "HARA MASALA KA MURGH(CHICKEN),MALAI KOFTA ,RICE,RASAM,BUTTERMILK,BABY POTATO PORIYAL, VEG SOUP,  GULAB JAMUN, MILK, GHEE PHULKA, MUSKMELON"),
            Mon(
              breakfast:
                  "IDLI ,VADA CURRY,ONION CHUTNEY, ALOO MATAR POHA,BOILED EGG, BBJ,TMC, CORN FLAKES , GRAPES JUICE,SPROUTS WITH ONION AND LEMON, PODI, OIL",
              lunch:
                  "street style fried rice, street style egg fried rice, manchurian balls, rice, PEPPER rasam,  ,SALAD(TOMATO, CUCUMBER, ONIONS, CARROT),french fries,PARUPPU PODI,GHEE, BUTTERMILK",
              snacks: "TOASTED SANDWICH/CUTLET, TMC ",
              dinner:
                  "MASALA DOSA, PHULKA, ALOO SHIMLA MIRCH, RICE, RASAM, DAAL MAKHNI, GROUNDNUT CHUTNEY,MANGO,  CHOCOLATE MILK, TOMATO SOUP, PANEER BHURJI",
            ),
            Mon(
                breakfast:
                    "DOSA,SAMBAR,SABUDANA KICHIDI,TOMATO THOKKU,VADA,MASALA  BOILED EGG,CORNFLAKES,TMC,BBJ, WATERMELON JUICE,SPROUTS WITH ONION AND LEMON,  PODI, GINGLY OIL",
                lunch:
                    "VEG BRIYANI, CURD RICE WITH FRUITS,BRINJAL CURRY, DINDUGUL CHICKEN BRIYANI,ONION RAITHA,PHULKA,RICE,RASAM, GOBI 65,ICE CREAM,  MINT LEMON JUICE, BOILED EGG,CUCUMBER",
                snacks: "PUNUGULU, TMC",
                dinner:
                    "VEG PULAO,DAAL LEHSUNI ,CARROT ALOO GREENS  SABJI,  IDLY,SAMBAR,ROTI,RICE,RASAM, PEPPER MUSHROOM(DRY),PAPAYA, VANILLA CUSTARD,TOMATO CHUTNEY")
            // Widgets for Friday
          ],
        ),
      ),
    );
  }
}
