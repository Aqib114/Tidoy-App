//
//  CustomButtonTabs.swift
//  Tidoy App
//
//  Created by Mapple.pk on 08/05/2025.
//
//
import SwiftUI

struct CustomButtonTabs: View {
    @Namespace private var animation
    @Binding  var index : Int
    let titles : [String]
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<titles.count, id: \.self) { i in
                ZStack {
                    if index == i {
                        RoundedRectangle(cornerRadius: .cornerRadius2XL)
                            .fill(.background100)
                            .matchedGeometryEffect(id: "tabBackground", in: animation)
                    }
                    
                    Text(titles[i])
                        .frame(maxWidth: .infinity)
                        .font(.bodySMedium)
                        .foregroundStyle(index == i ? .text10 : .text100)
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        index = i
                    }
                }
            }
        }
        .background(.background20)
        .clipShape(RoundedRectangle(cornerRadius: .cornerRadius2XL))
        .frame(height: 50)
        .padding(.horizontal, .padding16)
    }
}

#Preview {
    CustomButtonTabs(index: .constant(0), titles: ["Username", "Phone Number"])
}
