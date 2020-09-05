import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class StatsOverview extends StatefulWidget {
  final String subtitle;
  final String metricUnit;
  final List<int> units;
  final Widget iconStat;
  final bool ruleMetrics;
  final bool media;
  final bool max;
  final bool min;
  StatsOverview(
      {Key key,
      this.metricUnit = "",
      this.units,
      this.iconStat,
      this.subtitle = "",
      this.ruleMetrics = true,
      this.media = true,
      this.max = true,
      this.min = true})
      : super(key: key);

  @override
  _StatsOverviewState createState() => _StatsOverviewState();
}

class _StatsOverviewState extends State<StatsOverview> {
  List<int> _units = [1, 2, 3, 4, 5, 6];
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
              fontSize: AppFontSizes.subitle18,
              fontFamily: AppFonts.Montserrat_Bold),
        ),
      ),
    );
  }

  Widget _buildRuleMetric () {
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
                    border:
                        Border.all(color: AppColors.PrimaryBlack, width: 1.0),
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
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "200 ${widget.metricUnit}",
                          style: AppTextStyle.blackStyle(
                            fontSize: 36,
                            fontFamily: AppFonts.Montserrat_Bold,
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
          widget.ruleMetrics ? _buildRuleMetric() : SizedBox(),
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
          SizedBox(
            height: 200,
            width: 320,
            child: Placeholder(),
          ),
          SizedBox(height: 50),
          widget.media ? _buildRate(label: AppStrings.media, unit: 20) : SizedBox(),
          widget.max ? _buildRate(label: AppStrings.maximumAbb, unit: 20) : SizedBox(),
          widget.min ? _buildRate(label: AppStrings.minimumAbb, unit: 20) : SizedBox(),
          !widget.media && !widget.max && !widget.min ? SizedBox() : SizedBox(height: 50),
        ],
      ),
    );
  }
}
