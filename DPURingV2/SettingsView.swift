//
//  SettingsView.swift
//  DPURingV2
//
//  Created by Berkant Beğdilili on 15.07.2020.
//

import SwiftUI


struct SettingsView: View {
    
    @ObservedObject var userData = UserData()
    
    let mapStyleArray = [ MapStyle(name: "StandartMapStyle",imageName: "standart"),
                          MapStyle(name: "SilverMapStyle",imageName: "silver"),
                          MapStyle(name: "NightMapStyle",imageName: "night"),
                          MapStyle(name: "DarkMapStyle",imageName: "dark"),
                          MapStyle(name: "RetroMapStyle",imageName: "retro"),
                          MapStyle(name: "AubergineMapStyle",imageName: "aubergine")]
    
    
    var body: some View{
        
        NavigationView{
            VStack(alignment: .center){
                Form{
                    
                    Section(header: Text("Harita Stili").font(.system(size: 16))){
                        
                        HStack{
                            List(mapStyleArray){ style in
                                Image(style.imageName)
                                    .resizable()
                                    .frame(width:50, height:50)
                                    .clipShape(Circle())
                                    .modifier(SelectionModifier(checked: userData.selectedMapStyle.name == style.name))
                                    .onTapGesture {
                                        userData.selectedMapStyle = style
                                    }
                            }
                        }
                        
                              
                    }
     
                }
            }.navigationBarTitle("Ayarlar", displayMode: .inline)
        }
        
        

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
