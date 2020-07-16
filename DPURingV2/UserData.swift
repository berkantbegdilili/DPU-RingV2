//
//  UserData.swift
//  DPURingV2
//
//  Created by Berkant Beğdilili on 15.07.2020.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    
    @Published var selectedMapStyle: MapStyle{
        didSet{
            UserDefaults.standard.set(selectedMapStyle.name, forKey: "mapStyle")
        }
        willSet{
            objectWillChange.send()
        }
    }
    
    @Published var mapStyle:String{
        didSet{
            UserDefaults.standard.set(mapStyle, forKey: "mapStyle")
        }
        willSet{
            objectWillChange.send()
        }
    }
    
    @Published var transportationData = TransportationData()
    
    init(){
        self.mapStyle = UserDefaults.standard.object(forKey: "mapStyle") as? String ?? "StandartMapStyle"
        self.selectedMapStyle = MapStyle(name: "StandartMapStyle", imageName: "standart")
    }
              
}


