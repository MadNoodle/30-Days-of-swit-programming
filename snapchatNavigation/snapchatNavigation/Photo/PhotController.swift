//
//  PhotController.swift
//  snapchatNavigation
//
//  Created by Mathieu Janneau on 01/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit
import AVFoundation

class PhotController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  

  @IBOutlet var cameraView: UIView!
  
  var captureSession : AVCaptureSession?
  var stillImageOutput : AVCapturePhotoOutput?
  var previewLayer : AVCaptureVideoPreviewLayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    UIApplication.shared.isStatusBarHidden = true
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    previewLayer?.frame = cameraView.bounds
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    captureSession = AVCaptureSession()
    captureSession?.sessionPreset = AVCaptureSession.Preset.hd1920x1080
    
    let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
    
    var error : NSError?
    var input: AVCaptureDeviceInput!
    
    do {
      input = try AVCaptureDeviceInput(device: backCamera!) }
    catch let error1 as NSError {
      error = error1
      input = nil
    }
    
    if (error == nil && captureSession?.canAddInput(input) != nil) {
      
      captureSession?.addInput(input)
      
      stillImageOutput = AVCapturePhotoOutput()

      
      if (captureSession?.canAddOutput(stillImageOutput!) != nil) {
        captureSession?.addOutput(stillImageOutput!)
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
        previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraView.layer.addSublayer(previewLayer!)
        captureSession?.startRunning()
      }
      
    }
    
  }
  
  @IBOutlet weak var tempImageView: UIImageView!
  
  func didPressTakePhoto(){
    
    if let videoConnection = stillImageOutput?.connection(with: AVMediaType.video){
      videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
      stillImageOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey : AVVideoCodecType.jpeg])], completionHandler: nil)
        
        
      
    }
    
    
  }
  
  
  var didTakePhoto = Bool()
  
  func didPressTakeAnother(){
    if didTakePhoto == true{
      tempImageView.isHidden = true
      didTakePhoto = false
      
    }
    else{
      captureSession?.startRunning()
      didTakePhoto = true
      didPressTakePhoto()
      
    }
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    didPressTakeAnother()
  }
  
  
}










