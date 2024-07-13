# TAM Chart

![Pub Version](https://img.shields.io/pub/v/tam_chart.svg) 
![License](https://img.shields.io/github/license/aman-netizen-ux/TAM-Chart)

A customizable charting package for Flutter, supporting all platforms.

A powerful and easy-to-use Flutter library for creating and displaying animated charts representing Total Addressable Market (TAM) data.

## Features
- **Animated Charts**: Animate the TAM, SAM, and SOM circles with configurable durations.
- **Customizable Styles**: Customize colors and text styles for each circle to match your app's theme.
- **Flexible Positioning**: Position the SOM circle within the chart using predefined positions (top, bottom, left, right, center).
- **Readable Numeric Values**: Format numeric values into readable strings (e.g., 1.5K for 1500, 1.5M for 1500000).
- **Easy Integration**: Seamlessly integrate the package into your Flutter project with minimal setup.

## Installing

```yaml
dependencies:
  tam_chart: ^1.0.0
```

### Import

```dart
import 'package:tam_chart/tam_chart.dart';
```

## How To Use

```dart
final chart= TAMChart(
            tamChartData: TAMChartData(
                duration: 16,
                tamTextColor: Colors.brown,
                samTextColor: Colors.white,
                somTextColor: Colors.black,
                tam: 450,
                sam: 13090,
                som: 750978,
                tamColor: Colors.pink,
                samColor: Colors.blue.shade100,
                somColor: Colors.green,
                somPosition: SomPositions.top),
            fontSize: 10,
            size: const Size(200, 200));
```


## Showcase
Here is an example screenshot of the TAM Chart in action:

![Example Screenshot](images/tamchart_example.gif)

## Suggestions & Bugs
For any suggestions or bug report please head to [issue tracker](https://github.com/aman-netizen-ux/TAM-Chart/issues). If you feel library is missing a feature, [pull request](https://github.com/aman-netizen-ux/TAM-Chart/pulls) are welcome


## Authors

<table>
  <tr>
    <td align="center">
      <img src="https://avatars.githubusercontent.com/u/85642044?v=4" alt="Aman Gautam" width="72" title="Aman Gautam" />
      <p align="center">
        <a href = "https://github.com/aman-netizen-ux"><img src = "https://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="18" height = "18"/></a>
        <a href = "https://x.com/aman_gautam2003?t=HXvWde8JVDAePxGgzFw-Mg&s=09"><img src = "https://www.shareicon.net/download/2016/07/06/107115_media.svg" width="18" height="18"/></a>
        <a href = "https://www.linkedin.com/in/amangautam19/"><img src = "https://www.iconninja.com/files/863/607/751/network-linkedin-social-connection-circular-circle-media-icon.svg" width="18" height="18"/></a>
      </p>
    </td>
    <td align="center">
      <img src="https://avatars.githubusercontent.com/u/85620483?v=4" alt="Abha Agarwal" width="72" title="Abha Agarwal" />
      <p align="center">
        <a href = "https://github.com/Spicysnowe"><img src = "https://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="18" height = "18"/></a>
        <a href = "https://www.linkedin.com/in/agarwalabha/"><img src = "https://www.iconninja.com/files/863/607/751/network-linkedin-social-connection-circular-circle-media-icon.svg" width="18" height="18"/></a>
      </p>
    </td>
  </tr> 
</table>

## License

MIT License









