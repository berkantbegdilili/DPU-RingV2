//
//  RingTimeView.swift
//  DPURingV2
//
//  Created by Berkant Beğdilili on 16.07.2020.
//

import SwiftUI

struct RingTimeView: View {
    
    @ObservedObject var userData = UserData()
    
    var body: some View {
        
        NavigationView{
            HStack{
                VStack{
                    Text("Tıp Fakültesi Kalkış")
                        .font(.headline)
                        .padding(.top, 10)
                    Divider()
                          
                    ScrollView(.vertical, showsIndicators: false){
                        
                        ForEach(userData.transportationData.parsed1!, id:\.self){ data in
                            Text(String(data))
                                
                            Divider()
                        }
                            
                    }
                }
                
                VStack{
                    Text("Dokuzlar Kalkış")
                        .font(.headline)
                        .padding(.top, 10)
                    Divider()
                    
                    ScrollView(.vertical, showsIndicators: false){
                        
                        ForEach(userData.transportationData.parsed2!, id:\.self){ data in
                            Text(String(data))
                            
                            Divider()
                        }
                            
                    }
                }
            }.navigationBarTitle("Ring Zamanları", displayMode: .inline)
        }
        
    }
    
}

struct RingTimeView_Previews: PreviewProvider {
    static var previews: some View {
        RingTimeView()
    }
}
