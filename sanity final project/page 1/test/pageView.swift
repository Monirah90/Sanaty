//
//  test.swift
//  Doctor profile
//
//  Created by Monirah aljarrah on 01/04/1444 AH.
//

import SwiftUI

struct pageView: View {
    let mentor : Mentor
    @State var close : Bool = false
    @State private var alertIsPresented = false
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            NavigationView() {
                
                VStack{
                    
                    Image(mentor.imageName)
                        .resizable ()
                        .frame(width: 160, height: 160)
                        .clipShape(Circle())
                        .padding(.top, 40.0)
                    
                    Text(mentor.name)
                        .foregroundColor(Color("title"))

                        .font(.system(size : 36 , weight: .semibold ))
                        
                    
                    Text(mentor.headline)
                        .foregroundColor(Color("mini"))

                    
                    Rectangle()
                        .foregroundColor(Color("text"))
                        .frame(width: 300, height: 1, alignment: .center)
                        .padding(10)
                    
                    Text("About Me")
                        .foregroundColor(Color("title"))
                        .font(.system(size : 21 , weight: .bold))
                       
                    
                    Text(mentor.bio)
                        .foregroundColor(Color("mini"))
                        .font(.system(size : 18 , weight: .regular))
                        
                        .frame( width: 350)
                        .multilineTextAlignment(.center)
                    
                        .padding(50)
                   
                    HStack {
                        
                  
                    Link("You can reach me at", destination: URL(string: "mailto:jon.doe@mail.com")!)
                        
                        Image(systemName: "envelope")
                            .foregroundColor(Color("text"))
                        
                }
                    
                }
           .offset( x :2 , y :-50)
           
           .navigationTitle("Mentor Profile")
         
         
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(
                    Color("bar"),
                    for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
               
                
                .navigationBarItems(trailing:
                                        Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    close.toggle()
                })
                                    {Image(systemName: "xmark")}
                                    
                )
                .font(.system(size: 20))
                
                    
                .navigationBarItems(leading:  Button(action: {
                    self.alertIsPresented = false
                }) {Image(systemName: "bell.and.waves.left.and.right")}
                )
                .font(.system(size: 20))
                .alert(isPresented: $alertIsPresented, content: {
                    Alert(title: Text("Let Us Send You Push Notifications"),
                          message: Text("Don't Miss Your Favorite Mentor's Safe Space Stream!"),
                          primaryButton:.default(Text("Allow"),
                                                 action: {self.send()
}
                                                ),
                          secondaryButton: .cancel(Text("Don't Allow")))
                })
                    .padding()
            
                    .toolbarColorScheme(.dark, for: .navigationBar)
                       }
        
        }
                                
       
        

struct pageView_Previews: PreviewProvider {
    static var previews: some View {
        pageView(mentor: mentorData[0])
    }
}
    func send() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("All set!")
                } else if let error = error {
                    print(error.localizedDescription)
                }
                
            }
        
             
            let content = UNMutableNotificationContent()
            content.title = "Message"
            content.sound = UNNotificationSound.default
             
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }
                }
