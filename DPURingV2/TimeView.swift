//
//  TimeView.swift
//  DPURingV2
//
//  Created by Berkant Beğdilili on 15.07.2020.
//

import SwiftUI

struct TimeView: View {
    
    @ObservedObject var userData = UserData()
    
    @State private var time11 = "--:--"
    @State private var time12 = "--:--"
    @State private var time21 = "--:--"
    @State private var time22 = "--:--"
    
    var body: some View {
        HStack{
            
            GroupBox{
                VStack{
                    Text("Tıp Fakültesi Kalkış")
                        .bold()
                        .font(.headline)
                    
                    Divider()
                    
                    Text("Önceki Kalkış \n \(time11)")
                        .font(.subheadline)
                        
                    Text("Sonraki Kalkış \n \(time12)")
                        .font(.subheadline)
                }
                
                
            }.frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .multilineTextAlignment(.center)
            .cornerRadius(15)
            
            GroupBox{
                VStack{
                    Text("Dokuzlar\nKalkış")
                        .bold()
                        .font(.headline)
                    
                    Divider()
                    
                    Text("Önceki Kalkış \n \(time21)")
                        .font(.subheadline)
                    Text("Sonraki Kalkış \n \(time22)")
                        .font(.subheadline)
                    
                }
                
            }.frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .multilineTextAlignment(.center)
            .cornerRadius(15)
            
        }.onAppear {
            for p1 in userData.transportationData.parsed1! {
                if p1>=userData.transportationData.clock!{
                    time12 = String(p1)
                    break
                }
                
                time11 = String(p1)
            }
            
            for p2 in userData.transportationData.parsed2! {
                if p2>=userData.transportationData.clock!{
                    time22 = String(p2)
                    break
                }
                
                time21 = String(p2)
            }
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimeView()
            TimeView()
                .previewDevice("iPhone 7")

        }
    }
}
