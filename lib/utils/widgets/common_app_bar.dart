import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final bool showHeader;
  final bool showLogout;
  const CommonAppBar(
      {Key key,
      this.title = "",
      this.showHeader = false,
      this.showLogout = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.PrimaryLightBlue,
        borderRadius:
            AppBorderRadius.onlyBottom(bottomRadius: AppBorderRadius.radius15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: _content(),
    );
  }

  Widget _content() {
    if (!showHeader) return _bottomContent();
    return SizedBox(
      height: 120,
      child: Column(
        children: [
          _headerContent(),
          _bottomContent(),
        ],
      ),
    );
  }

  Widget _headerContent() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back, size: 40, color: AppColors.PrimaryWhite),
          _actions(),
        ],
      ),
    );
  }

  Widget _bottomContent() {
    return Container(
      height: showHeader ? 70 : 100,
      padding: EdgeInsets.only(bottom: 30),
      child: !showHeader && showLogout
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: AppTextStyle.whiteStyle(
                      fontSize: AppFontSizes.title24,
                      fontFamily: AppFonts.Montserrat_Black),
                ),
                _actions(),
              ],
            )
          : Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: AppTextStyle.whiteStyle(
                    fontSize: AppFontSizes.title24,
                    fontFamily: AppFonts.Montserrat_Black),
              ),
            ),
    );
  }

  Widget _actions() {
    return SizedBox(
      height: 50,
      child: Row(
        children: <Widget>[
          showLogout
              ? Icon(Icons.exit_to_app, size: 40, color: AppColors.PrimaryWhite)
              : Container(),
          SizedBox(width: 10),
          SizedBox(
            height: 40,
            width: 40,
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications,
                    size: 35, color: AppColors.PrimaryGrey),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.PrimaryOrange,
                        border: Border.all(
                            width: 3.0, color: AppColors.PrimaryWhite)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
