# SimplePageViewController

A really simple page view controller subclass for convenience

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)

## Example Usage

`let pageViewController = SimplePageViewController(withViewControllers: viewControllers)`

### With `UIPageControl`
#### The `SimplePageViewController` can update the `selectedIndex` of a `UIPageControl` you pass it, 

`let pageViewController = SimplePageViewController(withViewControllers: viewControllers)`
`pageViewController.pageControl = pageControl // Some pagecontrol attacted to the view controllers`
