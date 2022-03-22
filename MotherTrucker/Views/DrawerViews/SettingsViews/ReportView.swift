//
//  ReportView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/18/22.
//

import SwiftUI

struct ReportView: View {
    @Environment(\.presentationMode) var presentationMode
    var width, height: CGFloat
    @State var reportingWho: String = ""
    @State var report: String = "Incident Description"
    @State var textEditorInteraction: Bool = false
    @State var showConfirmation: Bool = false
    @State var showSuccess: Bool = false
    
    var body: some View {
        ZStack {
            Color(hex: 0xE8E8E8)
                .ignoresSafeArea()
            GeometryReader { _ in
                VStack {
                    Text("*False Reporting has consquences and will not be tolerated.")
                        .font(.custom(Custom.Poppins.medium, size: 15))
                        .foregroundColor(Color(hex: 0x808080))
                    
                    Widget(w: width, h: round(height * 0.4938)) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Who are you reporting?")
                                .fontWeight(.semibold)
                                .font(.system(size: 15))
                            
                            TextField("Username", text: $reportingWho)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            
                            TextEditor(text: $report)
                                .padding()
                                .onTapGesture {
                                    textEditorInteraction = true
                                    if report == "Incident Description" {
                                        report = ""
                                    }
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }.padding()
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.spring()) {
                            showConfirmation = true
                        }
                    } label: {
                        ZStack {
                            Color(hex: 0xA4EDC2)
                                .frame(width: round(width * 0.7657), height: round(height * 0.0762))
                            
                            Text("Confirm")
                                .padding()
                        }.cornerRadius(10)
                    }.buttonStyle(.plain)
                    .opacity(textEditorInteraction ? 0 : 1)
                }// End of VStack
            }.ignoresSafeArea(.keyboard, edges: .bottom)
            .padding()
            
            Card(width: width, height: height, showing: $showConfirmation, message: "Are you sure you want to report this trucker?") {
                Button {
                    withAnimation(.spring()) {
                        showConfirmation = false
                        showSuccess = true
                    }
                } label: {
                    YesButton(w: width, h: height)
                }.buttonStyle(.plain)
            }
            .frame(height: 50)
            .offset(y: showConfirmation ? height / 3 : height / 1.5)
            
            NotificationCard(width: width, height: height, showing: $showSuccess, message: "Report Uploaded Successfully!")
                .frame(height: 50)
                .offset(y: showSuccess ? height / 3 : height / 1.5)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(backgroundColor: .white)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Report")
                    .fontWeight(.bold)
                    .font(.system(size: 21))
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Button {
                        textEditorInteraction = false
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        if report  == "" {
                            report = "Incident Description"
                        }
                    } label: {
                        Text("Done")
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                    }
                    .opacity(textEditorInteraction ? 1 : 0)
                    .buttonStyle(.plain)
                    
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        ZStack {
                            Capsule()
                                .fill(.black)
                                .frame(width: 30, height: 2)
                                .rotationEffect(.init(degrees: -45))
                            Capsule()
                                .fill(.black)
                                .frame(width: 30, height: 2)
                                .rotationEffect(.init(degrees: 45))
                        }
                    }
                }
            }
        }
    }
}
