//
//  ViewController.swift
//  videoPlayer
//
//  Created by Mathieu Janneau on 28/02/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
  
  // MARK: - Data
  
  let movies = [
    Movies(title:"Load local Video", thumbnail:"amf1", url: "/Users/mathieujanneau/Desktop/videoPlayer/videoPlayer/SupportingFiles/amf.mp4", source: .local),
    Movies(title:"What a Bunny?", thumbnail:"bunny", url: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4", source:.distant),
    Movies(title:"Master Yoda", thumbnail:"yoda", url: "https://r3---sn-q4flrnee.googlevideo.com/videoplayback?fvip=1&id=o-ALk5DjTc1CBMeqVtZA7R3sPE7_E597vMaDhWq0u4GHCJ&expire=1519852281&key=yt6&mime=video%2Fmp4&ip=23.106.75.46&lmt=1472219732849027&ipbits=0&sparams=dur%2Cei%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cexpire&itag=22&c=WEB&ei=mcaWWtf8IM-YuwXQhYeIDA&dur=45.348&pl=19&initcwndbps=2171250&mv=m&source=youtube&ratebypass=yes&signature=CC96C2CB15CE8A8A1619EED97CF93F962D575877.0F7843FDAB84ED331E4AF9E20E26BA901958C1E8&ms=au%2Crdu&mn=sn-q4flrnee%2Csn-q4f7sn7e&mm=31%2C29&mt=1519830586&requiressl=yes&video_id=8U9X6I0xVNc&title=Ma%C3%AEtre+Yoda+-+%C2%ABFais-le%2C+ou+ne+le+fais+pas%2C+mais+il+n%27y+a+pas+d%27essai.%C2%BB", source:.distant),
    Movies(title:"video_2", thumbnail:"video_2", url: "/Users/mathieujanneau/Desktop/videoPlayer/videoPlayer/SupportingFiles/amf.mp4", source:.local),
    Movies(title:"video_1", thumbnail:"video_1", url: "https://r2---sn-5hnednlk.googlevideo.com/videoplayback?fvip=2&lmt=1518127617824466&c=WEB&ei=Z8uWWrDsIofmyQWej6_wDQ&id=o-AFELXWtg2Gc1jQt3EJLbtMD2d-IuFkG4Gq9yJrFCVoHX&initcwndbps=1343750&itag=22&ipbits=0&sparams=dur%2Cei%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cexpire&signature=B62DB9E926E0FD60B739526F7EDC2047279A459C.D9D51EE486490BFC61A89CA2E1C788C9A6B3F437&ip=213.152.165.214&expire=1519853511&dur=187.176&pl=25&source=youtube&ms=au%2Crdu&mime=video%2Fmp4&mv=m&mt=1519831837&ratebypass=yes&mn=sn-5hnednlk%2Csn-5hne6nsd&mm=31%2C29&requiressl=yes&key=yt6&video_id=6TkFojsmdpw&title=Funny+And+Cute+Bunny+Rabbit+Videos+Compilation+2014+%5BNEW%5D", source:.distant),
    Movies(title:"video_2", thumbnail:"video_2", url: "/Users/mathieujanneau/Desktop/videoPlayer/videoPlayer/SupportingFiles/amf.mp4", source:.local)
  ]
  
  
  // MARK: - LIFECYCLE METHODS
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollection()
  }
  
  // MARK: - COLLECTION VIEW
  // cells info
  let cellNib = UINib(nibName: "videoThumbnailCollectionViewCell", bundle: nil)
  let cellId = "videoCell"
  @IBOutlet weak var videoCollection: UICollectionView!
  fileprivate func setupCollection() {
    videoCollection.delegate = self
    videoCollection.dataSource = self
    videoCollection.register(cellNib, forCellWithReuseIdentifier: cellId)
    videoCollection.reloadData()
  }
  
  // MARK: - PLAYER METHODS
  // Video player
  var avPlayer = AVPlayer()
  var playerViewcontroller = AVPlayerViewController()
  fileprivate func playLocalVideo(url: String) {
    let fileUrl = URL(fileURLWithPath:url)
    avPlayer = AVPlayer(url: fileUrl)
    presentPlayer()
  }
  
  
  fileprivate func presentPlayer() {
    playerViewcontroller.player = avPlayer
    self.present(playerViewcontroller, animated: true) {
      self.playerViewcontroller.player?.play()
    }
  }
  
  
  fileprivate func playDistantVideo(url: String) {
    let fileUrl = URL(string:url)
    avPlayer = AVPlayer(url: fileUrl!)
    presentPlayer()
  }
  
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? VideoThumbnailCollectionViewCell
    let currentMovie = movies[indexPath.row]
    
    cell?.thumbnail.image = UIImage(named: currentMovie.thumbnail)
    cell?.videoTitle.text = currentMovie.title
    return cell!
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let currentMovie = movies[indexPath.row]
    if currentMovie.source == .local
    {
      playLocalVideo(url: currentMovie.url)
    }
    else {
      playDistantVideo(url: currentMovie.url)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = 240
    return CGSize(width:collectionView.bounds.size.width,height: CGFloat(height))
  }
  
}

