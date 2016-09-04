namespace DBUtility
{
    using DevExpress.XtraCharts;
    using DevExpress.XtraCharts.Web;
    using System;
    using System.Data;
    using System.Drawing;

    public static class ChartServices
    {
        public static void DrawChart(WebChartControl control, string seriesName, ViewType type, DataTable dt, string column1, string column2)
        {
            Series series = new Series(seriesName, type);
            DataTable table = dt;
            SeriesPoint point = null;
            for (int i = 0; i < table.Rows.Count; i++)
            {
                point = new SeriesPoint(table.Rows[i][column1].ToString(), new double[] { Convert.ToDouble(table.Rows[i][column2].ToString()) });
                series.Points.Add(point);
            }
            control.Series.Add(series);
            if (type == ViewType.Pie)
            {
                series.LegendPointOptions.PointView = PointView.ArgumentAndValues;
                series.LegendPointOptions.ValueNumericOptions.Format = NumericFormat.Percent;
            }
        }

        public static void SetAxisX(WebChartControl control, bool isVisible, StringAlignment aligment, string text, Color color, bool isAntialiasing, Font font)
        {
            XYDiagram diagram = (XYDiagram) control.Diagram;
            diagram.AxisX.Title.Visible = isVisible;
            diagram.AxisX.Title.Alignment = aligment;
            diagram.AxisX.Title.Text = text;
            diagram.AxisX.Title.TextColor = color;
            diagram.AxisX.Title.Antialiasing = isAntialiasing;
            diagram.AxisX.Title.Font = font;
        }

        public static void SetAxisY(WebChartControl control, bool isVisible, StringAlignment aligment, string text, Color color, bool isAntialiasing, Font font)
        {
            XYDiagram diagram = (XYDiagram) control.Diagram;
            diagram.AxisY.Title.Visible = isVisible;
            diagram.AxisY.Title.Alignment = aligment;
            diagram.AxisY.Title.Text = text;
            diagram.AxisY.Title.TextColor = color;
            diagram.AxisY.Title.Antialiasing = isAntialiasing;
            diagram.AxisY.Title.Font = font;
        }

        public static void SetChartTitle(WebChartControl control, bool isVisible, string text, StringAlignment alignment, ChartTitleDockStyle dock, bool isAntialiasing, Font font, Color textColor, int indent)
        {
            ChartTitle title = new ChartTitle();
            title.Visible = isVisible;
            title.Text = text;
            title.Alignment = alignment;
            title.Dock = dock;
            title.Antialiasing = isAntialiasing;
            title.Font = font;
            title.TextColor = textColor;
            title.Indent = indent;
            control.Titles.Add(title);
        }
    }
}

