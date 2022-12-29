//
//  ContentView.swift
//  test
//
//  Created by Hadeel Alturaier on 29/03/1444 AH.
//

import SwiftUI

struct ContentView: View {
    
    @State var sgmentedChoice=0
    
    @State var title: String = ""

    var body: some View {
        NavigationView {
            
          
ZStack {
              (Color("background"))
                    .ignoresSafeArea()
    VStack {
       /* Rectangle()
            .padding(.top)
            .frame(height: 0)
            .background(Color("bar"))
    */
                    
        VStack{
            ZStack{
                
                VStack{
                    Text("Welcome..")
                        .multilineTextAlignment(.leading)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("title"))
                        .multilineTextAlignment(.leading)
                        .font(.title3)
                        .padding(.bottom, 6.0)
                        
    
                    
                    Text("Healing takes time, and asking for help is a courageous step. We welcome you to our safe space. Remain consistent !")
                        .frame(height: 80)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("text"))
                    .multilineTextAlignment(.center)}
            }
            
            .padding().frame(width: 367, height: 121)
                .background(.white)
                .cornerRadius(21)
                .position(x: 195, y: 100)
                .shadow(color: .gray, radius: 4, x: 0, y: 2)
            
        }
        
                        }
        ZStack{
            VStack {
                
                
                
                Picker("",selection: $sgmentedChoice){
                    Text("Live Stream").tag(0)
                    Text("Mentors").tag(1)
                }
                .position (x:180,y:200)
                    .padding().pickerStyle(SegmentedPickerStyle())
                if(sgmentedChoice == 0){
                    livestrem()
                        .frame(height:600)
                    
                }
                if(sgmentedChoice == 1){
                    Mentors()
                        .frame(height:600)
                }
                
                
                HStack{
                    
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $title)  }
                    
                        .foregroundColor(Color("ser1"))
                        .padding(.horizontal)
                        .frame(width: 326, height: 40 , alignment:.leading)
                    
                        .background(Color("ser"))
                        .cornerRadius(15)
                        .position(x: 195, y: 100)
                        .position(x:195,y:-480)
                    
                
            }
                        }
                    }
               
.navigationTitle("Sanity")


     .navigationBarTitleDisplayMode(.inline)
     .toolbarBackground(
         Color("bar"),
         for: .navigationBar)
     .toolbarBackground(.visible, for: .navigationBar)
    
        //.navigationTitle("Sanity")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
                    
                    
                    
                }
            }
        }
        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//page live stream
struct livestrem: View {

@State var sgmentedChoice=0

    @State var shouldShowDetailsView = false
    @State var selectedMentor : Mentor = mentorData[0]
    var body: some View {
        
        ZStack{
            List(mentorData) {mentor in
                ScrollView{
                    HStack {Image(mentor.imageName)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 65.0, height: 65.0)
                        .padding(.top, 10)
                    VStack(alignment: .leading){
                        Text (mentor.live)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                        Text (mentor.name)
                            .font(.subheadline)
                            .foregroundColor(Color("mini"))
                    }
                    Spacer()
                    VStack(){ Image(systemName: "eye").font(.title2)
                        Text ("100K")
                            .font(.footnote)
                    }.foregroundColor(.gray)
                }
                    .onTapGesture {
                        selectedMentor = mentor
                        shouldShowDetailsView.toggle()
                    }
                    .fullScreenCover(isPresented: $shouldShowDetailsView) {
                        StreamUI(mentor: selectedMentor)
                    }
                    
                }
                
                
            }
            
        }.position(x:195,y:530)

}
}
//page mentors
struct Mentors: View {
    @State private var searchText = ""
    
    @State var shouldShowDetailsView = false
    @State var selectedMentor : Mentor = mentorData[0]
    
    @State var sgmentedChoice=1
    
    var body: some View {
        
        ZStack{
            List(mentorData) {mentor in
                ScrollView{
                    HStack {Image(mentor.imageName)
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: 65.0, height: 65.0)
                            .padding(.top, 10)
                        VStack(alignment: .leading){
                            Text (mentor.name)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("text"))
                            Text (mentor.headline)
                                .font(.subheadline)
                                .foregroundColor(Color("mini"))
                        }
                    }
                    .onTapGesture {
                        selectedMentor = mentor
                        shouldShowDetailsView.toggle()
                    }
                    .fullScreenCover(isPresented: $shouldShowDetailsView) {
                        pageView(mentor: selectedMentor)
                    }
                    
                }
            }.position(x:195,y:530)
            
            
        }
        
        
        
    }
    
    
    
    
    
}
