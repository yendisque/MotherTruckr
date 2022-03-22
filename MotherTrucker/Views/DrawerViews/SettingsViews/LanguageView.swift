//
//  LanguageView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/21/22.
//

import SwiftUI

struct LanguageView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var languageModel = LanguagesModel()
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Color(hex: 0xE8E8E8)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Your Languages")
                    .font(.custom(Custom.Poppins.medium, size: 15))
                    .foregroundColor(Color(hex: 0x808080))
                Widget(w: width, h: round(height * 0.0503)) {
                    LanguageRow(width: width, height: height, text: "English", rowLanguage: .english, assignedLanguage: $languageModel.language)
                }
                Text("Add another language")
                    .font(.custom(Custom.Poppins.medium, size: 15))
                    .foregroundColor(Color(hex: 0x2ED573))
                Text("The first language in this list is used as the primary language for the app.")
                    .font(.custom(Custom.Poppins.medium, size: 12))
                    .foregroundColor(Color(hex: 0x939393))
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(backgroundColor: .white)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Language")
                    .fontWeight(.bold)
                    .font(.system(size: 21))
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
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

class LanguagesModel:ObservableObject {
    @Published var language: Languages = .english
}

enum Languages {
    case english
    case arabic
    case french
    case portuguese
    case spanish
    case mandarin
    case hangul
}
