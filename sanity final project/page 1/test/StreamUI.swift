
import SwiftUI
import AVKit

struct StreamUI: View {
    let mentor : Mentor
    @State var shouldShowDetailsView = false
    @State var selectedMentor : Mentor = mentorData[0]
    @State var close : Bool = false
    @Environment(\.presentationMode) var presentationMode
    struct CustomColor {
        static let myColor = Color("title")
    }
    @State private var alertIsPresented = false
    @State private var alertIsPresentedcom = false
    @State var animate = false
    @State var button = false
    @State var text = ""
    @State private var messageText = " "
    @State var messages: [String] = []
    private let player = AVPlayer(url: URL(string: "https://cbsn-us.cbsnstream.cbsnews.com/out/v1/55a8648e8f134e82a470f83d562deeca/master_11.m3u8")!)
   
    var body: some View {
        ZStack{
            VideoPlayer(player: player).onAppear()
            {player.play()}
            
            VStack{
                HStack{
                    HStack{
                        Image(mentor.imageName)
                            .resizable()
                            .cornerRadius(40)
                            .frame(width: 44,height: 44)
                            .padding(3)
                        
                        Text(mentor.name)
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(CustomColor.myColor)
                            .onTapGesture {
                                selectedMentor = mentor
                                shouldShowDetailsView.toggle()
                            }
                            .fullScreenCover(isPresented: $shouldShowDetailsView) {
                                pageView(mentor: selectedMentor)
                            }
                        Spacer()
                        
                        HStack{
                            VStack{
                                Image(systemName: "eye")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 20))
                                
                                Text("100K").foregroundColor(Color.gray)
                                    .font(.system(size: 9))
                            }.foregroundColor(Color.black)
                 
                            Button(action: {
                                self.alertIsPresented = true
                            }, label: { Image(systemName: "bell.and.waves.left.and.right")
                                    //.bold()
                                    .foregroundColor(.gray)
                                    .font(.system(size: 21))
                            })

                            .foregroundColor(Color.gray)
                            .font(.system(size: 21))
                            .padding(.trailing,5)
                            .padding(.trailing,5)
                           .alert(isPresented: $alertIsPresented, content: {
                               Alert(title: Text("Let Us Send You Push Notifications"),
                                     message: Text("Don't Miss Your Favorite Mentor's Safe Space Stream!"),
                                     primaryButton:.default(Text("Allow"),

                                                            action: {self.send()
                               }
                                                           ),
                                     secondaryButton: .cancel(Text("Don't Allow")))
                           })
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(21)
                    Button(action: {
presentationMode.wrappedValue.dismiss()
close.toggle()
})
                {Image(systemName: "xmark")}
                        .foregroundColor(Color.white)
                        .font(.system(size: 30))
                        .padding(.leading,60)
                    
                }.padding(.top,35)
                
                VStack{
                    ScrollView {
                        ForEach(messages, id: \.self)
                        { message in
                            HStack {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .foregroundColor(Color.white)
                                    .frame(width: 30,height: 30)
                                //.cornerRadius(8)
                                VStack{
                                    Text("User 01")
                                        .font(.system(size: 13))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text(message)
                                        .font(.system(size: 13))
                                        .multilineTextAlignment(.center)
                                }
                                .frame(height: 30 , alignment: .leading)
                                .padding(.horizontal,10)
                                .padding(5)
                                .background(Color.white.opacity(0.5))
                                .cornerRadius(10)
                                
                                Spacer()
                            }
                            .padding(.bottom,5)
                        }
                    }
                    
                    Button(action: {
                        
                        self.alertIsPresentedcom = true
                    }, label: {
                        HStack{
                            TextField("Add Comment", text: $messageText)
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white))
                                .onSubmit {
                                    sendMessage(message: messageText)
                                }
                            
                            Button {
                                sendMessage(message: messageText)
                            } label: {
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(Color.white)
                        }
                        .font(.system(size: 26))
                        .padding(.horizontal, 10)
                        }
                        .padding(.bottom,30)
                      
                    })
 
                   .alert(isPresented: $alertIsPresentedcom, content: {
                       Alert(title: Text("Safe Space"),
                             message: Text("This is a safe space for everyone, please be mindful of what you say."),
                             dismissButton: .default(Text("Continue")))
                   })
                       
                }.padding(.top,475)
                
                
                
            }.frame(alignment: .leading)
                .padding()
                .ignoresSafeArea()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.55), .clear, .clear, .clear]), startPoint: .bottom, endPoint: .top))
            
        }.ignoresSafeArea()
        
        
        
    }
    func sendMessage(message: String) {
        withAnimation {
            messages.append(message)
            self.messageText = ""
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
    
    
    
    
}//struct


struct StreamUI_Previews: PreviewProvider {
    static var previews: some View {
        StreamUI(mentor: mentorData[0])
      
    }
}
