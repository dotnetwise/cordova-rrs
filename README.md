#### REPO For Crosswalk BUG #XWALK-2367
https://crosswalk-project.org/jira/browse/XWALK-2367


```batch
git clone https://github.com/dotnetwise/cordova-rrs
cd cordova-rrs
git checkout play-crosswalk
cordova run android --device
```

Steps to reproduce:
* The app starts in full immersive mode
* Scroll, see 4 lines on bottom
* Tap into an input
* The keyboard shows up and the immersive mode is "out"
* Close the keyboard
* Try to scroll again
* The content will be behind the android keys and the top status bar -> That's the BUG!
* You cannot get back into the immersive mode, unless you close the app and open again.
