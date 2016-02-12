
import Foundation
import UIKit

final class SimplePageViewController: UIPageViewController {
    
    var customViewControllers: Array<UIViewController>
    
    /// Allows the page view controlller to manage a page control
    var pageControl: UIPageControl?
    
    /**
     Initalises a new UIPageViewController and sets the view controllers passsed as a 
     parameter to the datasource
     
     - parameter viewControllers: The view controllers included in the UIPageViewController
     */
    init (withViewControllers viewControllers: Array<UIViewController>) {

        // Initalise the properties
        self.customViewControllers = viewControllers
        
        // Call the super designated initaliser
        super.init(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        
        // Set the UIPageViewController view controllers and default settings
        setViewControllers([customViewControllers[0]], direction: .Forward, animated: true, completion: nil)
        dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        self.customViewControllers = Array<UIViewController>()
        
        super.init(coder: aDecoder)
    }    
}

extension SimplePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var nextViewController: UIViewController?
        
        if let index = customViewControllers.indexOf(viewController) {
            pageControl?.currentPage = index
            
            if index != customViewControllers.count - 1 {
                nextViewController = customViewControllers[index + 1]
            }
        }
        
        return nextViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var nextViewController: UIViewController?
        
        if let index = customViewControllers.indexOf(viewController) {
            pageControl?.currentPage = index
            
            if index != 0 {
                nextViewController = customViewControllers[index - 1]
            }
        }
        
        return nextViewController
    }
}