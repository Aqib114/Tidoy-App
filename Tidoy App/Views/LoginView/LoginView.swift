//
//  LoginView.swift
//  Tidoy App
//
//  Created by Mapple.pk on 08/05/2025.
//

import SwiftUI

struct LoginView: View {
    @State var selectedIndex: Int = 0
    @State private var isPasswordVisible = false
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var phoneNumber: String = ""
    @State  var usernameState: TextFieldState
    @State  var passwordState: TextFieldState
    var titles = ["Username", "Phone Number"]
    var body: some View {
        
        VStack{
            headerView
                .padding(.top, 60)
            CustomButtonTabs(index: $selectedIndex, titles: titles)
                .padding(.top, 25)
            Group {
                if selectedIndex == 0 {
                    usernameLoginSection
                } else {
                    phoneLoginSection
                }
            }
            .padding(.top, 20)
            PrimaryButton(title: "Login", action: {})
                .frame(height: 50)
                .padding(.top, 32)
            orDivider
                .padding(.top, 30)
            
            socialLoginButtons
                .padding(.top, 30)
            
            registerText
                .padding(.top, 32)
            
            Spacer()
        }
        .padding(.horizontal,.padding16)
        .ignoresSafeArea()
    }
    
    private var headerView: some View {
        HStack{
            Text("Welcome to Tidoy  👋 ")
                .font(.heading6)
                .foregroundStyle(.text100)
            Spacer()
            Image("ic_Close")
        }
        .padding(.padding16)
    }
    
    private var usernameLoginSection: some View {
        VStack(spacing: 12) {
            CustomTextField(
                state: $usernameState,
                text: $username,
                isSecure: .constant(false),
                title: "Username",
                leftIcon: Image(systemName: ""),
                rightIcon: Image(systemName: ""),
                hint: "",
                placeholder: "Enter your user name",
                rightIconAction: {
                })
            .frame(height: 90)
            CustomTextField(
                state: $passwordState,
                text: $password,
                isSecure: .constant(true),
                title: "Password",
                leftIcon: Image(systemName: ""),
                rightIcon: Image(systemName: "eye"),
                hint: "",
                placeholder: "********",
                rightIconAction: {
                })
            .frame(height: 90)
            
            HStack {
                Text("Need Help?")
                    .font(.bodyXSSemiBold)
                    .foregroundStyle(.text90)
                Spacer()
                Text("Forgot Password")
                    .font(.bodyXSSemiBold)
                    .foregroundStyle(.text90)
            }
        }
    }
    private var phoneLoginSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            PhoneNumberTextField(
                state: .constant(.normal),
                text: $phoneNumber,
                placeholder: "ex : 81234567890",
                flagCode: "🇮🇩 +92",
                iconAction: {}
            )
            .frame(height: 90)
            
            Text("We'll call or text you to confirm your number. Standard\nmessage and data rates apply")
                .font(.bodyXSRegular)
                .foregroundStyle(.text100)
        }
    }
    private func inputLabel(_ text: String) -> some View {
        HStack {
            Text(text)
                .font(.bodySMedium)
                .foregroundStyle(.text100)
            Spacer()
        }
    }
    private var orDivider: some View {
        ZStack {
            Divider()
                .frame(height: 1)
            Text("OR")
                .foregroundStyle(.text60)
                .font(.bodyXSSemiBold)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(.background30)
                .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusM))
        }
    }
    private var socialLoginButtons: some View {
        HStack(spacing: 12) {
            socialButton(image: "logo_Google", color: .googleBackground)
            socialButton(image: "logo_Facebook", color: .facebookBackground)
            socialButton(image: "logo_Apple", color: .appleBackground)
        }
        .frame(height: 56)
    }
    
    private func socialButton(image: String, color: Color) -> some View {
        RoundedRectangle(cornerRadius: .cornerRadiusM)
            .fill(color)
            .overlay {
                Image(image)
            }
    }
    private var registerText: some View {
        HStack {
            Text("Don’t have an account?")
                .font(.bodySRegular)
                .foregroundStyle(.text100)
            Text("Register Here")
                .font(.bodySSemiBold)
                .foregroundStyle(.primaryMain)
        }
    }
}

#Preview {
    LoginView(usernameState: .normal, passwordState: .normal)
}
