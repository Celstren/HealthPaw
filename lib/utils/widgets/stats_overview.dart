import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/utils/widgets/stats_field.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StatsOverview extends StatefulWidget {
  final String subtitle;
  final String metricUnit;
  final List<int> units;
  final Widget iconStat;
  final bool media;
  final bool max;
  final bool min;
  final Widget history;
  final bool reduceData;
  @required final Pet pet;
  StatsOverview(
      {Key key,
      this.metricUnit = "",
      this.units,
      this.iconStat,
      this.subtitle = "",
      this.media = true,
      this.max = true,
      this.min = true,
      this.history,
      this.reduceData = false, 
      this.pet})
      : super(key: key);

  @override
  _StatsOverviewState createState() => _StatsOverviewState();
}

class _StatsOverviewState extends State<StatsOverview> {
  List<int> _units;
  Widget _iconStat = Placeholder();

  @override
  void initState() {
    if (widget.units != null && widget.units.length == 6) {
      _units = widget.units;
    }
    if (widget.iconStat != null) {
      _iconStat = widget.iconStat;
    }
    super.initState();
  }

  Widget _buildUnitMetrics(int unit) {
    return SizedBox(
      width: 30,
      child: Center(
        child: Text(
          "$unit",
          style: AppTextStyle.blackStyle(
              fontSize: AppFontSizes.text14,
              fontFamily: AppFonts.Montserrat_Bold),
        ),
      ),
    );
  }

  Widget _buildRuleMetric() {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Text(
            AppStrings.average,
            style: AppTextStyle.blackStyle(
                fontSize: AppFontSizes.text12,
                fontFamily: AppFonts.Montserrat_Bold),
          ),
          Container(
            height: 10,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.PrimaryBlack, width: 1.0),
            ),
          ),
          SizedBox(
            width: 330,
            child: Row(
              children: <Widget>[
                _buildUnitMetrics(_units[0]),
                SizedBox(width: 30),
                _buildUnitMetrics(_units[1]),
                SizedBox(width: 30),
                _buildUnitMetrics(_units[2]),
                SizedBox(width: 30),
                _buildUnitMetrics(_units[3]),
                SizedBox(width: 30),
                _buildUnitMetrics(_units[4]),
                SizedBox(width: 30),
                _buildUnitMetrics(_units[5]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRate({String label = "", double unit = 0.0}) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 120,
            child: Text(
              "$label:",
              style: AppTextStyle.blackStyle(
                fontSize: AppFontSizes.subitle18,
                fontFamily: AppFonts.Montserrat_Bold,
              ),
            ),
          ),
          SizedBox(
            child: Text(
              "$unit ${widget.metricUnit}",
              style: AppTextStyle.blackStyle(
                fontSize: AppFontSizes.subitle18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGraphStadistics() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200,
          width: 320,
          child: StatsField(data: widget.pet.statsSample.first.history),
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: widget.history != null
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          children: <Widget>[
            Column(children: <Widget>[
              widget.media
                  ? _buildRate(label: AppStrings.media, unit: 20)
                  : SizedBox(),
              widget.max
                  ? _buildRate(label: AppStrings.maximumAbb, unit: 20)
                  : SizedBox(),
              widget.min
                  ? _buildRate(label: AppStrings.minimumAbb, unit: 20)
                  : SizedBox(),
              !widget.media && !widget.max && !widget.min
                  ? SizedBox()
                  : SizedBox(height: 50),
            ]),
            widget.history != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundedButton(
                        size: Size(100, 30),
                        text: AppStrings.history,
                        style: AppTextStyle.whiteStyle(
                            fontSize: AppFontSizes.text12),
                        onPress: () => NavigationMethods.of(context)
                            .navigateReplacement(widget.history),
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        )
      ],
    );
  }

  Widget _buildShortStadisctics() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 80,
          width: 350,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Placeholder(),
                ),
                SizedBox(
                  height: 50,
                  child: Text(
                    "42 ${widget.metricUnit}",
                    style: AppTextStyle.blackStyle(
                      fontSize: AppFontSizes.title24,
                      fontFamily: AppFonts.Montserrat_Bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        RoundedButton(
          size: Size(160, 30),
          text: AppStrings.history,
          style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.text12),
          onPress: () =>
              NavigationMethods.of(context).navigateReplacement(widget.history),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 70, width: 100, child: _iconStat),
                SizedBox(width: 10),
                SizedBox(
                  height: 80,
                  width: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 140),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: AutoSizeText(
                            "200 ${widget.metricUnit}",
                            maxLines: 1,
                            style: AppTextStyle.blackStyle(
                              fontSize: 36,
                              fontFamily: AppFonts.Montserrat_Bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          widget.units != null && widget.units.isNotEmpty
              ? _buildRuleMetric()
              : SizedBox(),
          SizedBox(height: 20),
          Center(
            child: Text(
              widget.subtitle,
              style: AppTextStyle.blackStyle(
                fontSize: AppFontSizes.subitle18,
                fontFamily: AppFonts.Montserrat_Bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          widget.reduceData
              ? _buildShortStadisctics()
              : _buildGraphStadistics(),
        ],
      ),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}