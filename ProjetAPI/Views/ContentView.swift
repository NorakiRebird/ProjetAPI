//
//  ContentView.swift
//  ProjetAPI
//
//  Created by Rayann chaghla on 17/07/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                ListCharacterHp()
                }
            
            Tab("Schools", systemImage: "books.vertical.fill") {
                ListCharacterHp()
                }
            
            Tab("setting", systemImage: "gear") {
                Setting()
                
            }
           
            
                  
            }
        .tabBarMinimizeBehavior(.onScrollDown)
        
        .tint(.white)
        }
    }
    
    



#Preview {
    ContentView()
}
