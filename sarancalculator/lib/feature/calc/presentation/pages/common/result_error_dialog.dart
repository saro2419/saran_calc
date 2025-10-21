import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sarancalculator/common/constants/fontsize_constant.dart';
import 'package:sarancalculator/common/constants/spacing_constant.dart';
import 'package:sarancalculator/widgets/parent/custom_button.dart';
import 'package:sarancalculator/widgets/parent/custom_container.dart';
import 'package:sarancalculator/common/constants/color_constant.dart';

class ResultErrorDialog extends StatefulWidget {
  final String message;

  const ResultErrorDialog({super.key, required this.message});

  @override
  State<ResultErrorDialog> createState() => _ResultErrorDialogState();
}

class _ResultErrorDialogState extends State<ResultErrorDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeInBack,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  Future<void> _handleClose() async {
    await _controller.reverse(); // play pop-out animation
    if (mounted) Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        // Blur increases smoothly with fade animation value
        final blurValue = 6 * _fadeAnimation.value;
        final overlayOpacity = 0.3 * _fadeAnimation.value; // dark overlay sync

        return Stack(
          alignment: Alignment.center,
          children: [
            // 🔹 Blurred background + dark overlay
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
              // ignore: deprecated_member_use
              child: Container(color: Colors.black.withOpacity(overlayOpacity)),
            ),

            // 🔹 Animated dialog
            FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: SizedBox(
                  height: 400,
                  child: Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: const EdgeInsets.all(40),
                    child: CustomContainer(
                      padding: const EdgeInsets.all(SpacingConstant.md),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "<<< Error >>>",
                            style: TextStyle(
                              fontSize: PageHeading.small,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.roseRed,
                            ),
                          ),
                          const SizedBox(height: SpacingConstant.lg),
                          Text(
                            'Invalid Expression :(',
                            style: const TextStyle(
                              fontSize: PageSubHeading.small,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: SpacingConstant.md),
                          CustomButton(
                            text: "OK",
                            backgroundColor: ColorConstant.primary,
                            onPressed: _handleClose,
                            borderRadius: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
