#Advanced Navigation (Tumblr)
Leveraging animations and gestures to create custom navigation.

#### Time spent
12 hours spent in total

#### Project requirements
- [x] Tapping on Home, Search, Account, or Trending should show the respective screen and highlight the tab bar button.
- [x] Compose button should modally present the compose screen.
- [ ] Optional: Compose screen is faded in while the buttons animate in.
- [x] Optional: Login button should show animate the login form over the view controller.
- [ ] Optional: Discover bubble should bob up and down unless the SearchViewController is tapped.


#### Notes
#####Setting iOS Status Bar Color

[CoderWall](https://coderwall.com/p/dyqrfa/customize-navigation-bar-appearance-with-swift) has a straightforward guide for programatically setting the status bar color in iOS, app-wide.

Start by setting the boolean property of `view controller-based status bar`  in  `info.plist` to `No`. Then define the color of status bar in `didFinishLaunchingWithOptions` function in `AppDelegate.swift` as:

``UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
`

iOS 7.0 and newer constants include:

	UIStatusBarStyleLightContent
	A light status bar, intended for use on dark backgrounds.
	
	UIStatusBarStyleDefault
	A dark status bar, intended for use on light backgrounds.
	

#### Walkthrough of all user stories

![Video Walkthrough](tumblr.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

Change status bar color guide from [CoderWall](https://coderwall.com/p/dyqrfa/customize-navigation-bar-appearance-with-swift).
