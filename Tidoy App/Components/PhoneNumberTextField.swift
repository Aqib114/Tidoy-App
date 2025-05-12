//
//  PhoneNumberTextField.swift
//  Tidoy App
//
//  Created by Mapple.pk on 12/05/2025.
//

import SwiftUI

struct PhoneNumberTextField: View {
    @Binding var state: TextFieldState
    @Binding var text : String
    var placeholder: String
    var hint: String?
    var flagCode : String
    var iconAction: () -> Void
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack{
                RoundedRectangle(cornerRadius: .cornerRadiusS)
                    .fill(state.backgroundColor)
                    .stroke(state.borderColor, lineWidth: 1)
                    .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusS))
                    .frame( height: 50)
                    .overlay(){
                        HStack{
                            //
                            Text(flagCode)
                                .foregroundStyle(state.placeholderColor)
                                .font(.bodyMMedium)
                            
                            Image(systemName: "chevron.down")
                                .onTapGesture(perform: {
                                    iconAction()
                                })
                                .frame(width: 24, height: 24)
                                .foregroundStyle(state.iconColor)
                            
                            TextField("", text: $text)
                                .disabled(state == .disable)
                                .keyboardType(.numberPad)
                                .placeholder(when: text.isEmpty) {
                                    Text(placeholder).foregroundColor(state.placeholderColor)
                                }
                        }
                        .padding(.horizontal, .padding12)
                    }
            }
            if let hint = hint {
                HStack {
                    if state == .error {
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundStyle(state.iconColor)
                    }
                    Text(hint)
                        .font(.bodyXSRegular)
                        .foregroundStyle(state.hintColor)
                }
            }
        }
        
    }
}

#Preview {
    NumberFieldPreviewWrapper()
    
}

private struct NumberFieldPreviewWrapper: View {
    
    @State private var text: String = ""
    var body: some View {
        VStack(spacing: 10) {
            PhoneNumberTextField(state: .constant(.normal), text: $text, placeholder: "Normal TextField", hint: "This is normal hint", flagCode: "🇮🇩 +92", iconAction: {})
            
            PhoneNumberTextField(state: .constant(.focus), text: $text, placeholder: "Normal TextField", hint: "This is focus hint", flagCode: "🇮🇴 +353", iconAction: {})
            PhoneNumberTextField(state: .constant(.filled), text: $text, placeholder: "Normal TextField",hint: "This is filled hint", flagCode: "🇮🇩 +92",  iconAction: {})
            PhoneNumberTextField(state: .constant(.disable), text: $text, placeholder: "Normal TextField", hint: "This is disable hint", flagCode: "🇮🇩 +92", iconAction: {})
            PhoneNumberTextField(state: .constant(.error), text: $text, placeholder: "Normal TextField",hint: "This is error hint", flagCode: "🇮🇷 +62",  iconAction: {})
        }
        .padding(.horizontal, 12)
    }
    
}

