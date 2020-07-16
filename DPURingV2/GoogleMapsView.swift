//
//  GoogleMapsView.swift
//  DPURingV2
//
//  Created by Berkant Beğdilili on 15.07.2020.
//

import SwiftUI
import UIKit
import GoogleMaps
import GoogleMapsUtils

struct GoogleMapsView: UIViewRepresentable {

    @ObservedObject var userData = UserData()
    
    typealias UIViewType = GMSMapView
    
    func makeUIView(context: Context) -> GMSMapView {
        // Kamerayı DPU Kordinatlarına Getirme
            let camera = GMSCameraPosition(latitude: 39.4822726, longitude: 29.8923525, zoom: 15)
            
            let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        
        // Harita Ayarları
            mapView.settings.compassButton = true
            mapView.settings.allowScrollGesturesDuringRotateOrZoom = true
        
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        
        // Map Stili Değiştirme
            do {
                if let styleURL = Bundle.main.url(forResource: UserDefaults.standard.string(forKey: "mapStyle"), withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
              } else {
                NSLog("Unable to find style.json")
              }
            } catch {
              NSLog("One or more of the map styles failed to load. \(error)")
            }
        
        // Rota Çizme
            let path = Bundle.main.path(forResource: "ring", ofType: "kml")
            let url = URL(fileURLWithPath: path!)
            let kmlParser = GMUKMLParser(url: url)
            kmlParser.parse()

            let renderer = GMUGeometryRenderer(map: mapView,
                                           geometries: kmlParser.placemarks,
                                           styles: kmlParser.styles)

            renderer.render()
    }
    
}



struct GoogleMapsView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsView()
    }
}
