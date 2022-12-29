//
//  SplashScreenView.swift
//  test
//
//  Created by Hadeel Alturaier on 09/04/1444 AH.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        if isActive {
            ContentView ()
        
        } else {
            
            
            ZStack{  Color("splash")
                    .ignoresSafeArea()
                VStack{
                    
                    VStack{
                        Image("splashpic")
                            .resizable()
                            .frame(width: 300.0, height: 300.0)
                        Text ("Sanity")
                            .font(Font.custom("sfpro", size: 40))
                            .fontWeight(.bold)
                            .foregroundColor(Color("text").opacity(0.8))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.5)) {
                            self.size = 0.9
                            self.opacity = 1.0
                            
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
                
            }
        }
    }
}
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
