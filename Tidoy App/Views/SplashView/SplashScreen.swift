//
//  SplashScreen.swift
//  Tidoy App
//
//  Created by Mapple.pk on 18/04/2025.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack(){
            Color.orange.ignoresSafeArea()
           
            VStack {
                Spacer()
                Image("Logo")
                    .frame(alignment: .center)
                Image("Background")
                    .resizable()
                    .frame(maxWidth: .infinity,
                    maxHeight: 375)
            }
        }
        .ignoresSafeArea()
    }
}
#Preview {
    SplashScreen()
}
