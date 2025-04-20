![DogWalk Preview](.images/dogwalk-preview.gif)

# DogWalk

DogWalk is a fork of [CatWalk](https://store.kde.org/p/2137844), by [Driglu4it](https://github.com/Driglu4it). for KDE Plasma 6.

![License: GPL v2.0+](https://img.shields.io/badge/License-GPL%20v2.0%2B-blue.svg)

## Table of Contents

- [About](#about)
- [Purpose](#purpose)
- [Installation](#installation)
- [Roadmap](#roadmap)
- [Acknowledgment](#acknowledgment)
<<<<<<< HEAD
- [Conclusion](#conclusion)
=======
>>>>>>> master
- [License](#license)

---

## About

A simple plasmoid showing the total CPU usage which is a fork of [Driglu4it's](https://github.com/Driglu4it) [CatWalk](https://store.kde.org/p/2137844). [CatWalk](https://store.kde.org/p/2137844) itsself is modeled after [RunCat](https://kyome.io/runcat/index.html?lang=en), a macOS taskbar app by [Kyome𓃠](https://kyome.io/?lang=en).
 
## Purpose

The purpose of this project is to enable additional desktop customisation that is unique and personal. More imporantly it is a fun way to learn about git, project management, linux desktop developement and documentation. 

## Installation

### Requirements

- KDE Plasma 6.0 or higher
- Plasma System Monitor

### Installation Methods

#### 1. Manual Installation Using Terminal

```
git clone https://github.com/BelArvardan/DogWalk.git
cd DogWalk
mv org.kde.plasma.dogwalk $HOME/.local/share/plasma/plasmoids/
```

#### 2. Manual Installation from Desktop GUI

1. Right-click on the desktop or panel
    → Select “Add Widgets”
2. In the “Add Widgets” sidebar, click the 🛠️ settings icon (top-right corner of the widget panel)
    Choose “Install Widget from Local File...”
3. In the file picker dialog:
    Select "org.kde.plasma.dogwalk.tar.gz" file containing the widget
4. Click “Open”
    KDE will ask for confirmation; if valid, the widget will be installed.
5. You can now drag or double-click the new widget to add it to your desktop or panel.

#### 3. Automatic Installation from Desktop 

1. Right-click on the desktop or panel
    → Choose “Add Widgets”
2. In the “Add Widgets” sidebar, click the 🛠️ settings icon (top-right)
    → Select “Get New Widgets…”
3. In the “Get New Plasma Widgets” window:
    Search for "DogWalk"
4. Click “Install” on the one you want
    Once installed, drag the widget from the list onto your desktop or panel


#### 4. Automatic Installation from Web

1. 
2. 

---
## Roadmap

- [ ] Make package available on the [KDE Store](https://store.kde.org/browse?cat=705&ord=latest) to allow direct installation from the desktop.

- [ ] Fix SVGs to automatically recognize and adjust to system themes.

- [ ] Single unified tarball for installation.

- [ ] Improve the consitency and flow of the animation.

- [ ] Support Additional Localizations.

- [ ] Color Picker to allow user to select custom color.

- [ ] Aditional animals and objects similar to RunCat.

- [ ] Additional processes to follow beyond just the cpu.
## Acknowledgment

Thank you to all the people, animals and large language models that gave me the resources and motivation to make this.
In particular those listed below.

### Vladimir

Vladimir is my adopted German Shepherd/Husky Mix who was the inspiration behind making this. He also solely responsible for making sure that I put down my laptop and get some fresh air and excersize every day.

### Yuri Saurov

[Driglu4it](https://github.com/Driglu4it) is the creator of [CatWalk](https://store.kde.org/p/2137844) and is responsible for all of the code used in this project. All I really had to do was change a few words, icons and images.

### Takuto Nakamura

[Kyome𓃠](https://kyome.io/?lang=en) created [RunCat](https://kyome.io/runcat/index.html?lang=en), which was sited by [Driglu4it](https://github.com/Driglu4it) as the visual inspiration for his plasmoid CatWalk. I used and enjoyed [RunChenat](https://kyome.io/runcat/index.html?lang=en) when I was a mac user years ago.

### ChatGPT


---

## Conclusion



---

## License

[GNU General Public License v2.0 or later](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)

This project is licensed under the terms of the GNU GPL v2.0 or later.