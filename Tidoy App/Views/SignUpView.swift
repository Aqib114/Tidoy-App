//
//  SignUpView.swift
//  Tidoy App
//
//  Created by Mapple.pk on 12/05/2025.
//

import SwiftUI

struct SignUpView: View {
    @State  var usernameState: TextFieldState
    @State  var emailState: TextFieldState
    @State  var phoneNumberState: TextFieldState
    @State  var passwordState: TextFieldState
    @State  var confirmPasswordState: TextFieldState
    @State private var isPasswordSecure: Bool = true
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    
    var body: some View {
        VStack(spacing: 12){
            headerView
                .padding(.top, 60)
            CustomTextField(
                state: $usernameState,
                text: $username,
                isSecure: .constant(false),
                title: "Username",
                leftIcon: Image(systemName: ""),
                rightIcon: Image(systemName: ""),
                hint: "",
                placeholder: "ex : Johndoe123",
                rightIconAction: {})
            .frame(height: 90)
            CustomTextField(
                state: $emailState,
                text: $email,
                isSecure: .constant(false),
                title: "Email",
                leftIcon: Image(systemName: ""),
                rightIcon: Image(systemName: ""),
                hint: "",
                placeholder: "ex : username@gmail.com",
                rightIconAction: {})
            .frame(height: 90)
            PhoneNumberTextField(
                state: $phoneNumberState,
                text: $phoneNumber,
                placeholder: "ex : 81234567890",
                hint: "",
                flagCode: "🇮🇩 +92",
                title: "Phone Number",
                iconAction: {})
            .frame(height: 90)
            CustomTextField(
                state: $passwordState,
                text: $password,
                isSecure: $isPasswordSecure,
                title: "Password",
                leftIcon: Image(systemName: ""),
                rightIcon: Image(systemName: isPasswordSecure ? "eye" : "eye.slash"),
                hint: "",
                placeholder: "********",
                rightIconAction: {
                    isPasswordSecure.toggle()
                })
            .frame(height: 90)
            CustomTextField(
                state: $confirmPasswordState,
                text: $confirmPassword,
                isSecure: $isPasswordSecure,
                title: "Confirm Password",
                leftIcon: Image(systemName: ""),
                rightIcon: Image(systemName: isPasswordSecure ? "eye" : "eye.slash"),
                hint: "",
                placeholder: "********",
                rightIconAction: {
                    isPasswordSecure.toggle()
                })
            .frame(height: 90)
            PrimaryButton(title: "Register",action: {})
            .frame(height: 50)
            .padding(.top, 32)
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
            Text("Have an account?")
                .font(.bodySRegular)
                .foregroundStyle(.text100)
            Text("Login Here")
                .font(.bodySSemiBold)
                .foregroundStyle(.primaryMain)
        }
    }
}

#Preview {
    SignUpView(
        usernameState: .normal,
        emailState: .normal,
        phoneNumberState: .normal,
        passwordState: .normal,
        confirmPasswordState: .normal
    )
}
