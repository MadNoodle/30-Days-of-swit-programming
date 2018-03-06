//
//  ViewController.swift
//  scrollImage
//
//  Created by Mathieu Janneau on 06/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var imageView: UIImageView!
  var scrollView: UIScrollView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let shoeImage = UIImage(named:"shoes")
    imageView = UIImageView(image: shoeImage)
    
    setupScrollView()
    scrollView.delegate = self
    setZoomScaleFor(scrollViewSize: scrollView.bounds.size)
    scrollView.zoomScale = scrollView.minimumZoomScale
   
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    setZoomScaleFor(scrollViewSize: scrollView.bounds.size)
    if scrollView.zoomScale < scrollView.maximumZoomScale{
      scrollView.zoomScale = scrollView.minimumZoomScale
    }
    recenterImage()
  }

  // MARK: Setup ScrollView
  private func setupScrollView(){
    scrollView = UIScrollView(frame: view.bounds)
    scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    scrollView.backgroundColor = .black
    scrollView.contentSize = imageView.bounds.size
    scrollView.addSubview(imageView)
    view.addSubview(scrollView)
  }
  
  private func setZoomScaleFor(scrollViewSize: CGSize){
    let imageSize = imageView.bounds.size
    let widthScale = scrollViewSize.width / imageSize.width
    let heightScale = scrollViewSize.height / imageSize.height
    let minimunScale = min(widthScale, heightScale)
    
    scrollView.minimumZoomScale = minimunScale
    scrollView.maximumZoomScale = 3.0
    
  }
  private func recenterImage(){
    
    let scrollViewSize = scrollView.bounds.size
    let imageViewSize = imageView.frame.size
    let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
    let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
    
    scrollView.contentInset = UIEdgeInsets(top: verticalSpace, left: horizontalSpace, bottom: verticalSpace, right: horizontalSpace)
    
  }
  
  

}

extension ViewController: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return self.imageView
  }
  
  func scrollViewDidZoom(_ scrollView: UIScrollView) {
    return self.recenterImage()
  }
  
  
}
