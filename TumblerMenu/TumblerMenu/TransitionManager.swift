//
//  TransitionManager.swift
//  TumblerMenu
//
//  Created by Mathieu Janneau on 14/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

enum PresentationState {
  case present, dismiss
}

class TransitionManager:NSObject,UIViewControllerAnimatedTransitioning {
  
  
  var presentationState: PresentationState
 
  
  init(state: PresentationState){
    self.presentationState = state
  }
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 2.0
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
    let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
    if let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? MenuController{
      
      let finalFrame = transitionContext.finalFrame(for: toViewController)
      
      let containerView = transitionContext.containerView
      
      let key = UITransitionContextViewKey.to
      
      if let toView = transitionContext.view(forKey: key ){
        containerView.addSubview(toView)
      }
      
      animateIn(toViewController)
      
      toViewController.view.frame = finalFrame
      
      switch presentationState {
      case .present:
        showMenu(transitionContext, fromViewController, toViewController)
      case .dismiss:
        dismissMenu(transitionContext, fromViewController, toViewController)
      }
      
    }
  }
  
  fileprivate func showMenu(_ transitionContext: UIViewControllerContextTransitioning, _ fromViewController: UIViewController, _ toViewController: MenuController) {
    
    UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
      fromViewController.view.alpha = 0.0
      toViewController.view.alpha = 1.0
      
      toViewController.textPostIcon.transform = CGAffineTransform.identity
      toViewController.textPostLabel.transform = CGAffineTransform.identity
      
      toViewController.quotePostIcon.transform = CGAffineTransform.identity
      toViewController.quotePostLabel.transform = CGAffineTransform.identity
      
      toViewController.chatPostIcon.transform = CGAffineTransform.identity
      toViewController.chatPostLabel.transform = CGAffineTransform.identity
      
      toViewController.photoPostIcon.transform = CGAffineTransform.identity
      toViewController.photoPostLabel.transform = CGAffineTransform.identity
      
      toViewController.linkPostIcon.transform = CGAffineTransform.identity
      toViewController.linkPostLabel.transform = CGAffineTransform.identity
      
      toViewController.audioPostIcon.transform = CGAffineTransform.identity
      toViewController.audioPostLabel.transform = CGAffineTransform.identity

      
    }, completion: {
      (finished) in
      transitionContext.completeTransition(true)
      
    })
  }
  
  func offstage(amount: CGFloat) ->CGAffineTransform {
    return CGAffineTransform(translationX: amount, y: 0)
  }
  
  fileprivate func animateIn(_ toViewController: MenuController) {
    
    toViewController.view.alpha = 0.0
    let topRowOffset  : CGFloat = 300
    let middleRowOffset : CGFloat = 150
    let bottomRowOffset  : CGFloat = 50
    
    toViewController.textPostIcon.transform = self.offstage(amount: -topRowOffset)
    toViewController.textPostLabel.transform = self.offstage(amount: -topRowOffset)
    
    toViewController.quotePostIcon.transform = self.offstage(amount: -middleRowOffset)
    toViewController.quotePostLabel.transform = self.offstage(amount: -middleRowOffset)
    
    toViewController.chatPostIcon.transform = self.offstage(amount: -bottomRowOffset)
    toViewController.chatPostLabel.transform = self.offstage(amount: -bottomRowOffset)
    
    toViewController.photoPostIcon.transform = self.offstage(amount: topRowOffset)
    toViewController.photoPostLabel.transform = self.offstage(amount: topRowOffset)
    
    toViewController.linkPostIcon.transform = self.offstage(amount: middleRowOffset)
    toViewController.linkPostLabel.transform = self.offstage(amount: middleRowOffset)
    
    toViewController.audioPostIcon.transform = self.offstage(amount: bottomRowOffset)
    toViewController.audioPostLabel.transform = self.offstage(amount: bottomRowOffset)
  }
  
  fileprivate func dismissMenu(_ transitionContext: UIViewControllerContextTransitioning, _ fromViewController: UIViewController, _ toViewController: MenuController) {
    UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
      fromViewController.view.alpha = 0.5
      self.animateIn(toViewController)
      
    }, completion: {
      (finished) in
      transitionContext.completeTransition(true)
      UIApplication.shared.keyWindow?.addSubview(toViewController.view)
    })
  }
  

  

  
}
