//
//  OnBoardingScreen.swift
//  Tidoy App
//
//  Created by Mapple.pk on 18/04/2025.
//

import SwiftUI


struct OnBoardingScreen: View {
    @Binding  var isDisabled : Bool
    var body: some View {
        ZStack(){
            VStack(alignment: .leading){
                Image("onBoardingImg1")
                    .padding(.vertical, 28)
                Text("Gateway to Your \nAdventure")
                    .font(.heading4)
                    .foregroundStyle(.text100)
                    .padding(.horizontal, 16)
                Text("Enjoy various housing options, from\nbudget to luxury, in Tidoy.")
                    .padding(.horizontal, 16)
                    .foregroundStyle(.text60)
                HStack {
                    PrimaryButton(title: "Skip", disabled: $isDisabled, action: {})
                        .frame(width: 63)
                    PrimaryButton(title: "Next", disabled: $isDisabled, action: {})
                }
                .padding(.horizontal, 32)
                Spacer()
            }
        }
    }
}

#Preview {
    OnBoardingScreen(isDisabled: .constant(false))
}
