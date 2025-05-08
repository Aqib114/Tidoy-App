//
//  LoginView.swift
//  Tidoy App
//
//  Created by Mapple.pk on 08/05/2025.
//

import SwiftUI

struct LoginView: View {
    @State var selectedIndex: Int = 0
    var titles = ["Username", "Phone Number"]
    var body: some View {
        VStack{
            HStack{
                Text("Welcome to Tidoy  👋 ")
                    .font(.heading6)
                    .foregroundStyle(.text100)
                Spacer()
                Image("ic_Close")
            }
            .frame(height: 25)
            .padding(.padding16)
            .padding(.top, 45)
            Spacer()
                .frame(height: 25)
            CustomButtonTabs(index: $selectedIndex, titles: titles)
//                .onTapGesture {
//                    selectedIndex = selectedIndex == 0 ? 1 : 0
//                }
            Spacer()
                .frame(height: 12)
            if selectedIndex == 0 {
                HStack{
                    Text("Username")
                        .font(.bodySMedium)
                        .foregroundStyle(.text100)
                    Spacer()
                }
//                .padding(.padding16)
//                TextField("Enter your username", text: .constant(""))
//                    .frame(height: 50)
//                    .textFieldStyle(.roundedBorder)
                RoundedRectangle(cornerRadius: .cornerRadiusM)
                    .stroke(Color.background50, lineWidth: 1)
                    .frame(height: 50)
                    .overlay(alignment: .leading) {
                        Text("Enter your username")
                            .font(.bodyMMedium)
                            .foregroundStyle(.text60)
                            .padding(.leading, 16)
                    }
                HStack{
                    Text("Password")
                        .font(.bodySMedium)
                        .foregroundStyle(.text100)
                    Spacer()
                }
//                .padding(.padding16)
//                TextField("********", text: .constant(""))
//                    .frame(height: 50)
//                    .textFieldStyle(.roundedBorder)
                RoundedRectangle(cornerRadius: .cornerRadiusM)
                    .stroke(Color.background50, lineWidth: 1)
                    .frame(height: 50)
                    .overlay(alignment: .leading) {
                        Text("********")
                            .font(.bodyMMedium)
                            .foregroundStyle(.text60)
                            .padding(.leading, 16)
                            
                            
                    }
                Spacer()
                    .frame(height: 12)
                HStack{
                    Text("Need Help?")
                        .font(.bodyXSSemiBold)
                        .foregroundStyle(.text90)
                    Spacer()
                    Text("Forgot Password")
                        .font(.bodyXSSemiBold)
                        .foregroundStyle(.text90)
                }
                Spacer()
                    .frame(height: 56)
            }
            else {
                VStack(alignment: .leading){
                    Spacer()
                        .frame(height: 12)
                    HStack{
                        Text("Phone Number")
                            .font(.bodySMedium)
                            .foregroundStyle(.text100)
                        Spacer()
                    }
//                    .padding(.padding16)
                    RoundedRectangle(cornerRadius: .cornerRadiusM)
                        .stroke(Color.background50, lineWidth: 1)
                        .frame(height: 50)
                        .overlay(alignment: .leading) {
                            Text("🇮🇩 +62 ex : 81234567890")
                                .font(.bodyMMedium)
                                .foregroundStyle(.text60)
                                .padding(.leading, 16)
                                
                                
                        }
//                    TextField("Enter your Phone Number", text: .constant(""))
//                        .frame(height: 50)
//                        .textFieldStyle(.roundedBorder)
                    Text("We'll call or text you to confirm your number. Standard\n message and data rates apply")
                        .font(.bodyXSRegular)
                        .foregroundStyle(.text100)
                }
            }
            PrimaryButton(title: "Login", action: {})
                .frame(height: 50)
            Spacer()
                .frame(height: 32)
            VStack {
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
            Spacer()
                .frame(height: 30)
            HStack(spacing: 12){
                RoundedRectangle(cornerRadius: .cornerRadiusM)
                    .fill(.googleBackground)
                    .overlay(){
                        Image("logo_Google")
                    }
                RoundedRectangle(cornerRadius: .cornerRadiusM)
                    .fill(.facebookBackground)
                    .overlay(){
                        Image("logo_Facebook")
                    }
                RoundedRectangle(cornerRadius: .cornerRadiusM)
                    .fill(.appleBackground)
                    .overlay(){
                        Image("logo_Apple")
                    }
            }
            .frame(height: 56)
            Spacer()
                .frame(height: 32)
            HStack{
                Text("Don’t have an account?")
                    .font(.bodySRegular)
                    .foregroundStyle(.text100)
                Text("Register Here")
                    .font(.bodySSemiBold)
                    .foregroundStyle(.primaryMain)
            }
            Spacer()
        }
        .padding(.horizontal,.padding16)
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
