import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/ui/dialogs/dialogs.dart';

import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/services/services.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';
import 'package:habit_tracker_daily_tasker/routes.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    final Activity activity =
        ModalRoute.of(context)!.settings.arguments as Activity;

    return Scaffold(
        body: SafeArea(
      child: SimpleBackground(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomIconButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  topMargin: 10,
                  leftMargin: 20,
                  width: 30,
                  height: 30,
                  color: "ffffff",
                  image: "assets/icon_goback.png"),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: SizedBox(
                  width: 450,
                  child: Text(
                    activity.name,
                    style: TextStyles.h1,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const CustomDivider(),
              ActivityTimer(
                activity: activity,
              ),
              const CustomDivider(),
              _RepeatActivityOption(
                activity: activity,
              ),
              _ChangeActivityColorOption(
                activity: activity,
              ),
              const CustomDivider(),
              _DeleteActivityOption(
                activity: activity,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class _DeleteActivityOption extends StatelessWidget {
  final Activity activity;
  const _DeleteActivityOption({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => DeleteActivityDialog(
                  activity: activity,
                  toHome: true,
                ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Ionicons.trash),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Eliminar Actividad",
              style: TextStyles.h4,
            ),
          ],
        ),
      ),
    );
  }
}

class _RepeatActivityOption extends StatelessWidget {
  const _RepeatActivityOption({
    super.key,
    required this.activity,
  });

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Color.fromARGB(255, 140, 140, 140),
          context: context,
          builder: (context) {
            return Container();
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Ionicons.repeat_sharp),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 190,
              child: Text(
                "Repetir",
                style: TextStyles.h4,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ChangeActivityColorOption extends StatefulWidget {
  Activity activity;
  _ChangeActivityColorOption({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  State<_ChangeActivityColorOption> createState() =>
      _ChangeActivityColorOptionState();
}

class _ChangeActivityColorOptionState
    extends State<_ChangeActivityColorOption> {
  late Color _containerColor; // Variable para almacenar el color seleccionado
  bool isAcepted = false;

  @override
  void initState() {
    super.initState();

    _containerColor = Color(0xff9D72B7); // Color inicial
  }

  void onColorSelected(Color color) {
    setState(() {
      _containerColor = color; // Actualizar el color seleccionado
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Color.fromARGB(255, 140, 140, 140),
          context: context,
          builder: (context) {
            return Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 50, 50, 20),
                    child: ColorCarousel(onColorSelected: onColorSelected),
                  ),
                  CustomTextButton(
                    text: "Aceptar",
                    color: "FFF56D",
                    function: () async {
                      setState(() {
                        isAcepted = !isAcepted;
                      });
                      final dataService =
                          Provider.of<DataService>(context, listen: false);
                      final index = dataService.getIndex();
                      widget.activity.containerColor = _containerColor;
                      dataService.updateActivity(index, widget.activity);
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Ionicons.color_fill,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 190,
              child: Text(
                "Cambiar color",
                style: TextStyles.h4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
