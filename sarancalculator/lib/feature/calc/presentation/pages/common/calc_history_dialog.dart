import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sarancalculator/common/constants/color_constant.dart';
import 'package:sarancalculator/common/constants/spacing_constant.dart';
import 'package:sarancalculator/common/constants/fontsize_constant.dart';
import 'package:sarancalculator/widgets/parent/custom_button.dart';
import 'package:sarancalculator/widgets/parent/custom_container.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/results_bloc.dart';

class HistoryDialog extends StatefulWidget {
  final List<HistoryItem> history;

  const HistoryDialog({super.key, required this.history});

  @override
  State<HistoryDialog> createState() => _HistoryDialogState();
}

class _HistoryDialogState extends State<HistoryDialog>
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
    await _controller.reverse();
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
        final blurValue = 6 * _fadeAnimation.value;
        final overlayOpacity = 0.3 * _fadeAnimation.value;

        return Stack(
          alignment: Alignment.center,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
              child: Container(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(overlayOpacity),
              ),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: SizedBox(
                  width: 400,
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
                            "History",
                            style: TextStyle(
                              fontSize: PageHeading.small,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: SpacingConstant.md),
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: NoThumbScrollBehavior(),
                              child: ListView.separated(
                                itemCount: widget.history.length,
                                separatorBuilder: (_, __) => Divider(
                                  color: ColorConstant.primary,
                                  thickness: 1.5,
                                ),
                                itemBuilder: (context, index) {
                                  final item = widget.history[index];
                                  return ListTile(
                                    title: Text(
                                      item.expression,
                                      style: TextStyle(
                                        color: ColorConstant.roseRed,
                                        fontSize: PageSubHeading.small,
                                      ),
                                    ),
                                    subtitle: Text(
                                      item.result,
                                      style: TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: PageSubHeading.small,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: SpacingConstant.md),
                          CustomButton(
                            text: "Close",
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

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child; // no scrollbar thumb
  }
}
