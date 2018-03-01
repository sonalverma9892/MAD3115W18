//
//  ViewController.swift
//  MAD_3115_Day8_Maps
//
//  Created by MacStudent on 2018-03-01.
//  Copyright © 2018 sonal. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var myMap: MKMapView!
    
    //location coordinates
    let lambtonCollegeLocation = CLLocation(latitude: 43.773257, longitude: -79.335899)
    
    //default radius location
    let regionRadius: CLLocationDistance = 50
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myMap.mapType = MKMapType.standard
        
        centerMapOnLocation(location: lambtonCollegeLocation, title: "Lambton College", subTitle: "265 YorkLand Blvd.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //center map on specified location
    func centerMapOnLocation(location: CLLocation, title: String, subTitle: String){
        //get the location coordinates
        let coordinateREgion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        
        //focus the map on specified location
        myMap.setRegion(coordinateREgion, animated: true)
        
        //drop a pin at user's Current location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        myAnnotation.title = title
        myAnnotation.subtitle = subTitle
        
        //display pin on location
        myMap.addAnnotation(myAnnotation)
    }


}

