//
//  LocationView.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 20/5/21.
//

import CoreLocation
import SwiftUI

struct LocationView: View {
    @ObservedObject var eatery: Eatery
    @State var currentPosition = CLLocationCoordinate2D(latitude: 10, longitude: 5)
    //@State var locationName = ""
    @State var latitudeString = ""
    @State var longitudeString = ""
    
    var body: some View {
        VStack {
            MapView(coordinate: currentPosition)
            ScrollView {
    
            HStack {
                Text("Name:")
                TextField("Enter location name", text: $eatery.locationString, onCommit: {
                    let geoCoder = CLGeocoder()
                    let region = CLCircularRegion(center: self.currentPosition, radius: 2_000_000, identifier: "\(self.currentPosition)")
                    geoCoder.geocodeAddressString(eatery.locationString, in: region) { (placemarks, error) in
                        guard let location = placemarks?.first?.location else {
                            print("Error locating '\(eatery.locationString)': \(error.map {"\($0)"} ?? "<unknown error>")")
                            return
                        }
                        let position = location.coordinate
                        self.currentPosition.latitude = position.latitude
                        self.currentPosition.longitude = position.longitude
                        self.latitudeString = "\(position.latitude)"
                        self.longitudeString = "\(position.longitude)"
                    }
                })
            }
            HStack {
                Text("Latitude:")
                TextField("Enter latitude", text: $latitudeString, onCommit: {
                    guard let latitude = CLLocationDegrees(self.latitudeString),
                          let longitude = CLLocationDegrees(self.longitudeString) else {
                            print("Coordinates invalid")
                            return
                    }
                    self.currentPosition.latitude = latitude
                    self.currentPosition.longitude = longitude
                    let geoCoder = CLGeocoder()
                    let position = CLLocation(latitude: self.currentPosition.latitude, longitude: self.currentPosition.longitude)
                    geoCoder.reverseGeocodeLocation(position) { (placemarks, error) in
                        guard let placemark = placemarks?.first else {
                            print("Error locating \(self.currentPosition.latitude) / \(self.currentPosition.longitude): \(error.map {"\($0)"} ?? "<unknown error>")")
                            return
                        }
                        eatery.locationString = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "<unknown>"
                    }
                })
            }
            HStack {
                Text("Longitude")
                TextField("Enter longitude", text: $longitudeString, onCommit: {
                    guard let latitude = CLLocationDegrees(self.latitudeString),
                          let longitude = CLLocationDegrees(self.longitudeString) else {
                            print("Coordinates invalid")
                            return
                    }
                    self.currentPosition.latitude = latitude
                    self.currentPosition.longitude = longitude
                    let geoCoder = CLGeocoder()
                    let position = CLLocation(latitude: self.currentPosition.latitude, longitude: self.currentPosition.longitude)
                    geoCoder.reverseGeocodeLocation(position) { (placemarks, error) in
                        guard let placemark = placemarks?.first else {
                            print("Error locating \(self.currentPosition.latitude) / \(self.currentPosition.longitude): \(error.map {"\($0)"} ?? "<unknown error>")")
                            return
                        }
                        eatery.locationString = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "<unknown>"
                    }
                })
            }
                Button(action: {
                    currentPosition = currentPosition
                }, label: {
                    Text("Update")
                })
                .padding(.top)
        }
            .padding(.all)
        }
    }
}
