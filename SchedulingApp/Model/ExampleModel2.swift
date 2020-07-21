//
//  ExampleModel2.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/20/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

//
//  Address.swift
//  Requester
//
//  Created by Matthew Ruiz on 1/15/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//
/*
import Foundation
import GooglePlaces


protocol AddressCoordinatesReceivedDelegate {
    func updateRequesterLocation(address: Address)
    func handleLocationNotFound(error: String)
}

/// Use this class to store Address and Location information. Can be used as the Address for a User or a Job.
struct Address {
    var address: String?
    var houseNumber: String
    var street: String
    var city: String
    var state: String
    var zipcode: String
    private var location: Location = Location(latitude: 0.0, longitude: 0.0)
    
    var delegate: AddressCoordinatesReceivedDelegate?

    /**
    Locally stores various address components given after Autocomplete, by GooglePlaces, is used.
    
    - Parameters:
       - addressComponents: Contains the different components of an address (city, state, etc).
    */
    init(addressComponents: [GMSAddressComponent], delegate: AddressCoordinatesReceivedDelegate) {
        self.delegate = delegate
        houseNumber = addressComponents[0].name
        street = addressComponents[1].name
        city = addressComponents[2].name
        state = addressComponents[5].name
        if (addressComponents.count > 7) {
            zipcode = addressComponents[7].name
        } else {
            zipcode = addressComponents[6].name
        }
        
        address = self.buildAddress()
        self.convertAddressToCoordinates()
    }
    
    /**
    Locally stores various address components after logging in.
    */
    init(address: String, houseNumber: String, zipcode: String) {
        self.address = address
        self.houseNumber = houseNumber
        self.zipcode = zipcode
        self.street = ""
        self.city = ""
        self.state = ""
    }
    
    /**
     Format and return address.
     */
    public func buildAddress() -> String {
        return "\(houseNumber) \(street) \(city), \(state) \(zipcode)"
    }
    
    func convertAddressToCoordinates() {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address!) { (placemarks, error) in
            if let location = placemarks?.first?.location {
                self.location.latitude = location.coordinate.latitude
                self.location.longitude = location.coordinate.longitude
                self.delegate?.updateRequesterLocation(address: self)
            } else {
                print("Could not generate coordinates from address: \(error.debugDescription)")
                self.delegate?.handleLocationNotFound(error: error.debugDescription)
            }
        }
    }
    
    public func setLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.location.latitude = latitude
        self.location.longitude = longitude
    }
    
    public func getLatitude() -> CLLocationDegrees {
        return location.latitude ?? 0.0
    }
    
    public func getLongitude() -> CLLocationDegrees {
        return location.longitude ?? 0.0
    }
    
    
    /// Keep track of coordiantes and, if necessary, geohash.
    class Location {
        var latitude: CLLocationDegrees?
        var longitude: CLLocationDegrees?
        var geohash: String?
        
        init(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
            self.latitude = latitude
            self.longitude = longitude
        }
    }
}
*/
