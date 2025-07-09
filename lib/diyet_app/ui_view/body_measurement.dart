import 'package:best_flutter_ui_templates/fitness_app/fitness_app_theme.dart';
import 'package:flutter/material.dart';

class BodyMeasurementView extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const BodyMeasurementView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  _BodyMeasurementViewState createState() => _BodyMeasurementViewState();
}

class _BodyMeasurementViewState extends State<BodyMeasurementView> {
  static const avatarImages = [
    'assets/images/avatar.png',
    'assets/images/avatar1.png',
    'assets/images/avatar3.png',
  ];

  static const measurements = [
    'Göğüs: 98 cm\nBel: 82 cm',
    'Kollar: 32 cm\nUyluk: 54 cm',
    'Omuzlar: 112 cm\nSırt: 90 cm',
  ];

  int currentAvatarIndex = 0;

  String get currentAvatar => avatarImages[currentAvatarIndex];
  String get currentMeasurement => measurements[currentAvatarIndex];

  void _rotateAvatar() {
    setState(() {
      currentAvatarIndex = (currentAvatarIndex + 1) % avatarImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 300),
                              child: Image.asset(
                                currentAvatar,
                                key: ValueKey<String>(currentAvatar),
                                height: 220,
                              ),
                            ),
                            SizedBox(height: 8),
                            InkWell(
                              onTap: _rotateAvatar,
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade200,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.rotate_right,
                                  size: 24,
                                  color: FitnessAppTheme.nearlyDarkBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 24),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                          constraints: BoxConstraints(minWidth: 140),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            currentMeasurement,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: FitnessAppTheme.fontName,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: FitnessAppTheme.darkText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
