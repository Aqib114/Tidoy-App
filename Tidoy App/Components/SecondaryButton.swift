//
//  SecondaryButton.swift
//  Tidoy App
//
//  Created by Mapple.pk on 25/04/2025.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    var backgroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? .background30 : backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusM))
    }
    
    
}

struct SecondaryButton: View {
    var action: () -> Void
    var title: String?
    var leftIcon: Image?
    var rightIcon: Image?

    private var backgroundColor: Color {
        if disabled {
            return .background10
        } else {
            return .background10
        }
    }

    @Binding private var disabled: Bool

    init(title: String? = nil,
         leftIcon: Image? = nil,
         rightIcon: Image? = nil,
         disabled: Binding<Bool> = .constant(false),
         action: @escaping () -> Void) {
        self.action     = action
        self.title      = title
        self.leftIcon   = leftIcon
        self.rightIcon  = rightIcon
        self._disabled  = disabled
    }

    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack(spacing: .padding8) {
                leftIcon?
                    .foregroundStyle(disabled ? .icon50 : .icon100)
                    .frame(width: 24, height: 24)
                if let title {
                    Text(title)
                        .font(.bodySSemiBold)
                        .foregroundStyle(disabled ? .text50 : .text100)
                }
                rightIcon?
                    .foregroundStyle(disabled ? .icon50 : .icon100)
                    .frame(width: 24, height: 24)
            }
            .padding(.padding16)
            .frame(maxWidth: .infinity)
        })
        .buttonStyle(SecondaryButtonStyle(backgroundColor: backgroundColor))
        
        .disabled(disabled)
        .frame(maxWidth: .infinity)
        .overlay(){
            RoundedRectangle(cornerRadius: .cornerRadiusM)
                .stroke(disabled ? .stroke40 : .stroke50, lineWidth: 1)
                
        }
            
    }
}


#Preview {
    VStack(spacing: 20) {
        SecondaryButton(rightIcon: Image(systemName: "wifi")) {}
        SecondaryButton(title: "Button", leftIcon: Image(systemName: "plus.circle")) {}
        SecondaryButton(title: "Button", rightIcon: Image(systemName: "wifi")) {}
        SecondaryButton(title: "Disabled",
                      leftIcon: Image(systemName: "plus.circle"),
                      rightIcon: Image(systemName: "wifi"),
                      disabled: .constant(true),
                      action: {})
    }
    .padding()
}
