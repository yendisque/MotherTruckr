//
//  MessagesView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/22/22.
//

import SwiftUI

struct MessageModel: Hashable {
    var name, msg, time, picture: String
    var notifCount, id: Int
}

struct MessagesView: View {
    @EnvironmentObject var authentication: Authentication
    var width, height: CGFloat
    
    var placeholderData: [MessageModel] = [
        MessageModel(name: "Raghav", msg: "Can you deliver it by monday?",
                     time: "Today, 8:56pm", picture: "Raghav", notifCount: 0, id: 1),
        
        MessageModel(name: "Swathi", msg: "Sure!",
                     time: "Today, 2:31pm", picture: "Raghav", notifCount: 2, id: 2),
        
        MessageModel(name: "Kiran", msg: "Hi.....",
                     time: "Yesterday, 6:22pm", picture: "Raghav", notifCount: 1, id: 3),
        
        MessageModel(name: "Teje", msg: "I will call him today.",
                     time: "Today, 12:22pm", picture: "Raghav", notifCount: 0, id: 4)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                VStack {
                    HStack {
                        Text("Recent")
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                            .padding()
                            .offset(y: 5)
                        Spacer()
                    }
                    
                    ScrollView {
                        VStack(spacing: 30) {
                            ForEach(placeholderData, id: \.self) { msg in
                                VStack {
                                    Message(width: width, height: height,
                                            name: msg.name, msg: msg.msg,
                                            time: msg.time, picture: msg.picture, notifCount: msg.notifCount)
                                        .padding(.bottom)
                                    if msg.id != placeholderData.last?.id {
                                        Divider()
                                            .frame(width: width - 70)
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .frame(width: round(width * 0.9372), height: round(height * 0.5675))
                .background(Color.MessagesWhite)
                .cornerRadius(20)
                .shadow(radius: 5)
                .offset(y: -10)
                Spacer()
            }
            .offset(y: -25)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        authentication.updatedValidation(success: false)
                    } label: {
                        Image("Vector")
                            .font(.system(size: 30))
                    }
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Messages")
                        .fontWeight(.bold)
                        .font(.system(size: 35))
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Message: View {
    var width, height: CGFloat
    var name, msg, time, picture: String
    var notifCount: Int
    
    var body: some View {
        VStack {
            HStack {
                Image(name)
                    .frame(width: 70, height: 70)
                    .background(Color.orange)
                    .clipShape(Circle())
                    .padding(.leading)
                    .padding(.top)
                    
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    Text(msg)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(Color(hex: 0x4D4D4D, opacity: 0.75))
                }
                .padding(.leading)
                .padding(.top)
                
                Spacer()
                Spacer()
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(time)
                        .fontWeight(.medium)
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: 0x4D4D4D, opacity: 0.75))
                        .padding(.trailing, 0)
                    
                    if notifCount != 0 {
                        Spacer()
                        Text(String(notifCount))
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                            .background(Color(hex: 0x0A1FF))
                            .clipShape(Circle())
                            .offset(y: 10)
                    }
                    Spacer()
                }.padding(.trailing)
            }
        }
        .frame(height: round(height * 0.0872))
    }
}

struct MessagesView_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            MessagesView(width: geo.size.width, height: geo.size.height)
        }
    }
}
