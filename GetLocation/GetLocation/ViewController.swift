//
//  ViewController.swift
//  GetLocation
//
//  Created by Mathieu Janneau on 03/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

  @IBOutlet weak var map: MKMapView!
  @IBOutlet weak var cityDisplay: UILabel!
  
  let manager = CLLocationManager()
  let geoCoder = CLGeocoder()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    manager.delegate = self
    //accuracy sttings according to battery usage
    manager.desiredAccuracy = kCLLocationAccuracyBest
    // asks for authorization
    manager.requestWhenInUseAuthorization()
    manager.startUpdatingLocation()
    cityDisplay.layer.cornerRadius = 20.0
  }

  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location = locations[0]
    
    // Coordinates span radius
    let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
    // user current Location
    let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
    lookUpCurrentLocation(completionHandler: {(data) in
     
      self.cityDisplay.text = "You are in \((data?.locality)!),\((data?.country)!) "
    })
    
    // Define the map Region according to the user's location
    let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
    // display map
    map.setRegion(region, animated: true)
    // display blue Dot
    self.map.showsUserLocation = true
  }
  
  func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?)
    -> Void ) {
    // Use the last reported location.
    if let lastLocation = self.manager.location {
      let geocoder = CLGeocoder()
      
      // Look up the location and pass it to the completion handler
      geocoder.reverseGeocodeLocation(lastLocation,
                                      completionHandler: { (placemarks, error) in
                                        if error == nil {
                                          let firstLocation = placemarks?[0]
                                          completionHandler(firstLocation)
                                        }
                                        else {
                                          // An error occurred during geocoding.
                                          completionHandler(nil)
                                        }
      })
    }
    else {
      // No location was available.
      completionHandler(nil)
    }
  }

}

