//
//  Main.swift
//  snapchatNavigation
//
//  Created by Mathieu Janneau on 02/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class Main: UIPageViewController,UIPageViewControllerDataSource {

  lazy var controllersList: [UIViewController] = {
    let photoVc = PhotController(nibName: "PhotController", bundle: nil)
    let messageVc = MessageController(nibName: "MessageController", bundle: nil)
    let storiesVc = StoriesController(nibName: "StoriesController", bundle: nil)

    return [messageVc,photoVc,storiesVc]
  }()


    override func viewDidLoad() {
        super.viewDidLoad()
     self.dataSource = self
    
      if let firstViewController = controllersList.first {
        self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        
      }
        // Do any additional setup after loading the view.
    }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let vcIndex = controllersList.index(of:viewController) else {return nil}
    
    let previousIndex = vcIndex - 1
    
    guard previousIndex >= 0 else {return nil}
    
    guard controllersList.count > previousIndex else {return nil}
    return controllersList[previousIndex]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let vcIndex = controllersList.index(of:viewController) else {return nil}
    
    let nextIndex = vcIndex + 1
    
    guard nextIndex <= controllersList.count else {return nil}
    
    guard controllersList.count != nextIndex else {return nil}
    return controllersList[nextIndex]
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
