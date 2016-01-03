
import Foundation
import UIKit

class SimplePageViewController : UIPageViewController {
    
    var customViewControllers : Array<UIViewController>
    
    /**
     Initalises a new UIPageViewController and sets the view controllers passsed as a 
     parameter to the datasource
     
     - parameter viewControllers: The view controllers included in the UIPageViewController
     */
    init (withViewControllers viewControllers : Array<UIViewController>) {

        // Initalise the properties
        self.customViewControllers = viewControllers
        
        // Call the super designated initaliser
        super.init(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        
        // Set the UIPageViewController view controllers and default settings
        setViewControllers([customViewControllers.first!], direction: .Forward, animated: true, completion: nil)
        dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        self.customViewControllers = Array<UIViewController>()
        
        super.init(coder: aDecoder)
    }    
}

extension SimplePageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let index = customViewControllers.indexOf(viewController)
        
        if index == customViewControllers.count - 1 {
            return nil
        }
        else {
            return customViewControllers[index! + 1]
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let index = customViewControllers.indexOf(viewController)
        
        if index == 0 {
            return nil
        }
        else {
            return customViewControllers[index! - 1]
        }
    }
    
}


