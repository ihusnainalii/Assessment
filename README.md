# NYArticleTestApp


A simple app to hit the NY Times Most Popular Articles API and:
* Show a list of articles newest first(sorted based on date)
* Shows details when items on the list are tapped. 


i am using the most viewed section of this API.
http://api.nytimes.com/svc/mostpopular/v2/viewed/{period}.json?apikey= sample-key To test this API, 
For testAPI we used 
* 1 Day, 7 Days, 30 days for period
 
i have used MVVM Design pattern with RxSwift and swift generic approach to develop this application.

&nbsp; 

**App Flow:**

&nbsp; 
&nbsp; 

<kbd >
<img src="https://github.com/ihusnainalii/NYTimes/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2014%20-%202022-11-02%20at%2015.23.17.gif">
</kbd>

&nbsp; 
&nbsp;  

## Tools And Resources Used

- [CocoaPods](https://cocoapods.org/) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly.


## Library Used
- [Kingfisher](https://github.com/onevcat/Kingfisher) - This library provides an async image downloader with cache support.
- [MBProgressHUD](https://github.com/jdg/MBProgressHUD) - This library provides customize loading view.
- [Alamofire](https://github.com/Alamofire/Alamofire) - This library for neetwork handling.
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) - This library provides an async image downloader with cache support.
- [RxSwift & RxCocoa](https://github.com/ReactiveX/RxSwift) - This library provides a reactive Programming support in Swift .

## TODO
* Sorting option for user to sort article based popularity, Date, Alphabetically 

&nbsp; 

# Installation

* Installation by cloning the repository
* Go to directory
* use command + B or Product -> Build to build the project
* Incase of build fail due to dependency, install SDWebImageView using CocoaPods.
* Press run icon in Xcode or command + R to run the project on Simulator

&nbsp; 

# Architecture

i have used MVVM clean with RxSwift:

&nbsp; 
&nbsp; 

<kbd >
<img src="https://user-images.githubusercontent.com/15336778/41942613-a4008032-79bd-11e8-98b5-a40e7d871203.png" width="80%" height="80%">
</kbd>

</br>
</br>

# MIT License

Copyright 2018

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
