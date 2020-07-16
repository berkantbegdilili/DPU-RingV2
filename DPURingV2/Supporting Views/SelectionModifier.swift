//
//  SelectionModifier.swift
//  DPURingV2
//
//  Created by Berkant Beğdilili on 17.07.2020.
//

import SwiftUI

struct SelectionModifier: ViewModifier {
    
    var checked: Bool = false
    
    func body(content: Content) -> some View {
        
        Group {
            if checked {
                
                content.shadow(color:.black, radius: 5)
                           
            } else {
                content
            }
        }
        
    }
}
