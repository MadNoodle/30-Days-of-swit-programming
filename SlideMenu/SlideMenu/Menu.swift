//
//  setupMenu.swift
//  SlideMenu
//
//  Created by Mathieu Janneau on 13/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class Menu: NSObject {
  let menuItems = ["Graphic Design", "3D","Photo"]
  let blackView = UIView()
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 1
    let menu = UICollectionView(frame: .zero, collectionViewLayout: layout)
    menu.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    return menu
  }()
  
  func showMenu(){
    if let window = UIApplication.shared.keyWindow{
      // DarkMode setup
      blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
      blackView.addGestureRecognizer(UITapGestureRecognizer(target:self,action: #selector(handleDismiss)))
      
      window.addSubview(blackView)
      window.addSubview(collectionView)
      blackView.frame = window.frame
      collectionView.frame = CGRect(x:0, y: 50, width: window.frame.width, height: 0)
      // initial state
      blackView.alpha = 0
      
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
        self.blackView.alpha = 1
        self.collectionView.frame = CGRect(x:0, y: 50, width: window.frame.width, height: 200)
      }, completion: nil)
   
      
    }
  }
  
  @objc func handleDismiss(){
    
    UIView.animate(withDuration: 0.5, animations: {
      self.blackView.alpha = 0
      
    })
    self.collectionView.removeFromSuperview()
  }

  override init(){
    super.init()
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UINib(nibName:"MenuCell",bundle:nil), forCellWithReuseIdentifier: "menuCell")
    collectionView.reloadData()
  }
  
}

extension Menu: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return menuItems.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCell
    cell?.label.text = menuItems[indexPath.row]
    print(menuItems[indexPath.row])
    cell?.label.textColor = .white
    cell?.backgroundColor = #colorLiteral(red: 0.08999823779, green: 0.09210080653, blue: 0.2045442164, alpha: 1)
    return cell!
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / CGFloat(menuItems.count))
  }

  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath)
    cell?.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
  }
  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath)
     cell?.backgroundColor = #colorLiteral(red: 0.08999823779, green: 0.09210080653, blue: 0.2045442164, alpha: 1)
  }
}
