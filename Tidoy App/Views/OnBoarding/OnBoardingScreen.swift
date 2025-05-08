//
//  OnBoardingScreen.swift
//  Tidoy App
//
//  Created by Mapple.pk on 18/04/2025.
//

import SwiftUI
struct OnBoardingDataSourceModel : Hashable{
    var image: String
    var title: String
    var description: String
}

struct OnBoardingScreen: View {
    @Binding  var isDisabled : Bool
    @State private var index = 0
    let screenHeight = UIScreen.main.bounds.height
    let onBoardingDataSource: [OnBoardingDataSourceModel] =
    [
        OnBoardingDataSourceModel(
            image: "onBoardingImg1",
            title: "Gateway to Your Adventure",
            description: "Enjoy various housing options, from budget to luxury, in Tidoy."
        ),
        OnBoardingDataSourceModel(
            image: "onBoardingImg2",
            title: "Discover the Wonders of the World: Let's Explore!",
            description: "Book a stay wherever you are, whenever you want."
        ),
        OnBoardingDataSourceModel(
            image: "onBoardingImg3",
            title: "The Right Solution for Your Holiday Accommodation",
            description: "A stress-free Holiday? Trust your Holiday accommodation to Tidoy!"
        )
    ]
    
    var body: some View {
        VStack(){
            tabView
            pageView
            buttonsView
        }
    }
    
    private var tabView: some View {
        TabView(selection: $index){
            ForEach(0..<onBoardingDataSource.count, id: \.self){
                index in
                let model = onBoardingDataSource[index]
                VStack(alignment: .leading){
                    Image(model.image)
                        .rotationEffect(.degrees(index == self.index ? 360 : 0))
                    Text(model.title)
                        .font(.heading4)
                        .foregroundStyle(.text100)
                        .padding(.horizontal, 16)
                    Text(model.description)
                        .padding(.horizontal, 16)
                        .foregroundStyle(.text60)
                }
                .transition(.slide)
            }
        }
        .tag(index)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .padding(.horizontal, 16)
        .frame(height: screenHeight * 0.67)
    }
    
    private var pageView: some View {
        HStack{
            ForEach(onBoardingDataSource.indices, id: \.self) { index in
                if self.index == index  {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.primaryMain)
                        .frame(width: 26, height: 8)
                        .transition(.scale)
                }
                else {
                    Circle()
                        .foregroundStyle(.background30)
                        .frame(height: 8)
                }
            }
        }
        .frame(height: 20)
    }
    
    private var buttonsView: some View {
        HStack (spacing: 12)
        {
            if index < onBoardingDataSource.count - 1
            {
                SecondaryButton(
                    title: "Skip",
                    action: {
                        withAnimation{
                            index = onBoardingDataSource.count - 1
                        }
                    })
                .frame(width: 63)
            }
            PrimaryButton(
                title: index < onBoardingDataSource.count - 1
                ?"Next"
                :"Get Started",
                rightIcon: index<onBoardingDataSource.count - 1
                ? Image(systemName :"arrow.forward")
                : nil,
                disabled: $isDisabled,
                action:{
                    withAnimation{
                        if index < onBoardingDataSource.count - 1 {
                            index += 1
                        }
                        else
                        {
                            
                        }
                    }
                }
                
            )
        }
        .padding(.horizontal, 32)
    }
}

#Preview {
    OnBoardingScreen(isDisabled: .constant(false))
}
