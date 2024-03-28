//
//  ContentView.swift
//  RandomDog
//
//  Created by  Ixart on 27/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            ZStack {
                Color(.yellow)

                
                Button(action: {
                    // ACTion à mettre dedans
                }, label: {
                    
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 150, height: 80)
                            .foregroundColor(.black)
                            .cornerRadius(40)
                        
                        Image(systemName: "dog")
                            .font(.system(size: 40))
                            .foregroundColor(.white)

                    } // fin zstack
                    
                }) // FIN LABEL
                
               

                
               

                
            } // Zstack
        } // fin  vstack
        .ignoresSafeArea()
        
        
        
        
        
        
        
        
        
        
        
    } // fin body
} // fin strcut

#Preview {
    ContentView()
}
