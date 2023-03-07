//
//  LocationManager.swift
//  LocationRequest SwiftUI
//
//  Created by Sobirov on 06/03/23.
//

import CoreLocation

class LocationManager: NSObject,ObservableObject{
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestLocation(){
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        switch status{
            
        case .notDetermined:
            print("Debug not determined")
        case .restricted:
            print("Debug not restricted")
        case .denied:
            print("Debug not restricted")
        case .authorizedAlways:
            print("Debug not authorizedAlways")
        case .authorizedWhenInUse:
            print("Debug not authorizedWhenInUse")
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let location = locations.last else {return}
        self.userLocation = location
    }
}
