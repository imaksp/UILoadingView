UILoadingView
=============

Simple to use full screen loading view for iOS written in Swift

### Adding to your project:
To use this in your project, just download the UILoadingView.swift file and copy it into your project.

### Usage:
To use the basic loading view, you can do the following:
```
// initialize the loading view
let loadingView = UILoadingView(frame: self.view.bounds)
// show the loading view
self.view.addSubview(loadingView)
```
You may also specify custom text to use instead of "Loading..."
```
let loadingView = UILoadingView(frame: self.view.bounds, text: "Logging in...")
```

When you want the view to disappear, do this:
```
loadingView.removeFromSuperview()
```
