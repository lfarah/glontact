# Glontact
View and Edit contacts

<img src="https://user-images.githubusercontent.com/6511079/222737089-0d291d45-0632-4298-a827-cf8de6f45166.png"  width="200" height="200">

| Demo |
| --- |
![Simulator Screen Recording - iPhone 14 Pro - 2023-03-03 at 10 48 00](https://user-images.githubusercontent.com/6511079/222737645-63424cae-fe2b-45d0-9598-868d1d88debb.gif)

### How to run the app
The external libraries are installed in the project with SPM, so just pressing play should run the project correctly.

### Architecture
This app was made in MVVM. The architecture follows the following Layers:
* UI (```ContactsViewController```)
* ViewModel (```ContactsViewModel```)
* Service (```CSVManager```)

### External Tools
* [Swiftlint](https://github.com/realm/SwiftLint): tool to enforce Swift style and conventions.
* [SwiftCSV](https://github.com/swiftcsv/SwiftCSV): CSV Parsing
* [Eureka](https://github.com/xmartlabs/Eureka): Form UI

### Why did I use Eureka?
In a regular project, I would create the form entirely by myself. In my last project, I was the one who did the architecture for how a form would work with it's components and validations. With that said, unfortunately I couldn't spend much time in this specific take home test. Feel free to check how I build UI both in UIKit and SwiftUI in these take home tests I've done recently: [darwin generator](https://github.com/lfarah/darwin-generator) and [cstv](https://github.com/lfarah/cstv).

### What would I have done if I had more time?
* Repository Layer: It's job is to know where to fetch information from: Cache or Backend, for example
* Coordinator: it's job is to coordinate VC's presentation.
* Better UI with more colors and components.
* Custom Swiftlint rules
* Unit Tests for making sure contacts are edited properly
* Validation
* 100% custom Form UI, without any third party libraries
