//
//  ContentView.swift
//  DPURingV2
//
//  Created by Berkant Beğdilili on 15.07.2020.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var userData: UserData
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection){
            
            VStack{
                GoogleMapsView(userData: userData)
                    .edgesIgnoringSafeArea(.top)
                
                TimeView(userData: userData)
                    .padding()
                
            }.tabItem{
                Label("Harita", systemImage: tabSelection == 0 ? "map.fill":"map")
            }.tag(0)
                
            
            RingTimeView(userData: userData)
                .tabItem {
                    Label("Ring Zamanları", systemImage: tabSelection == 1 ? "clock.fill":"clock")
                }.tag(1)
            
            SettingsView(userData: userData)
                .tabItem {
                    Label("Ayarlar", systemImage: tabSelection == 2 ? "gearshape.fill":"gearshape")
                }.tag(2)
            
            
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
