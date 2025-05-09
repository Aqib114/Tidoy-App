//
//  CustomTextField.swift
//  Tidoy App
//
//  Created by Mapple.pk on 09/05/2025.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var state: TextFieldState
    @Binding var text : String
    var title: String
    var leftIcon : Image
    var rightIcon : Image
    var hint: String?
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6.0){
            Spacer()
            Text(title)
                .font(.bodySMedium)
                .foregroundStyle(state.labelColor)
            RoundedRectangle(cornerRadius: .cornerRadiusM)
                .fill(state.backgroundColor)
                .stroke(state.borderColor, lineWidth: 1)
                .frame(height: 50)
                .overlay(){
                    HStack{
                        leftIcon
                            .foregroundStyle(state.iconColor)
                        TextField("", text: $text)
                            .disabled(state == .disable ? true : false)
                            .placeholder(when: text.isEmpty) {
                                    Text("Placeholder recreated").foregroundColor(.gray)
                            }
                            .foregroundStyle(state.labelColor)
                            .font(.bodySMedium)
                        
                        rightIcon
                            .foregroundStyle(state.iconColor)
                    }
                    .padding(.horizontal, .padding12)
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
            Spacer()
        }
        .padding(.horizontal, .padding16)
    }
}

#Preview {
    PreviewWrapper()
}

private struct PreviewWrapper: View {
    @State private var text = ""

    var body: some View {
        VStack(spacing: 10) {
            CustomTextField(
                state: .constant(.normal),
                text: $text,
                title: "Label",
                leftIcon: Image(systemName: "plus.circle"),
                rightIcon: Image(systemName: "plus.circle"),
                hint: "This is an normal message",
                placeholder: "Enter text here"
            )
            CustomTextField(
                state: .constant(.focus),
                text: $text,
                title: "Label",
                leftIcon: Image(systemName: "plus.circle"),
                rightIcon: Image(systemName: "plus.circle"),
                hint: "This is an focus message",
                placeholder: "Enter text here"
            )
            CustomTextField(
                state: .constant(.filled),
                text: $text,
                title: "Label",
                leftIcon: Image(systemName: "plus.circle"),
                rightIcon: Image(systemName: "plus.circle"),
                hint: "This is an filled message",
                placeholder: "Enter text here"
            )
            CustomTextField(
                state: .constant(.disable),
                text: $text,
                title: "Label",
                leftIcon: Image(systemName: "plus.circle"),
                rightIcon: Image(systemName: "plus.circle"),
                hint: "This is an disable message",
                placeholder: "Enter text here"
            )
            CustomTextField(
                state: .constant(.error),
                text: $text,
                title: "Label",
                leftIcon: Image(systemName: "plus.circle"),
                rightIcon: Image(systemName: "plus.circle"),
                hint: "This is an error message",
                placeholder: "Enter text here"
            )
        }
        .padding()
    }
}
