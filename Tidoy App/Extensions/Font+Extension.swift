//
//  Font + Extension.swift
//  Tidoy App
//
//  Created by Mapple.pk on 18/04/2025.
//

import Foundation
import SwiftUI

extension Font{
    //Headings
    static let heading1 = getFont(.manropeBold, 48)
    static let heading2 = getFont(.manropeBold, 40)
    static let heading3 = getFont(.manropeBold, 32)
    static let heading4 = getFont(.manropeBold, 24)
    static let heading5 = getFont(.manropeBold, 20)
    static let heading6 = getFont(.manropeBold, 18)
    
    //Body
    static let bodyLSemiBold = getFont(.manropeSemiBold, 18)
    static let BodyLMedium = getFont(.manropeMedium, 18)
    static let bodyLRegular = getFont(.manropeRegular, 18)
    static let bodyMSemiBold = getFont(.manropeSemiBold, 16)
    static let bodyMMedium = getFont(.manropeMedium, 16)
    static let bodyMRegular = getFont(.manropeRegular, 16)
    static let bodySSemiBold = getFont(.manropeSemiBold, 14)
    static let bodySMedium = getFont(.manropeMedium, 14)
    static let bodySRegular = getFont(.manropeRegular, 14)
    static let bodyXSSemiBold = getFont(.manropeSemiBold, 12)
    static let bodyXSMedium = getFont(.manropeMedium, 12)
    static let bodyXSRegular = getFont(.manropeRegular, 12)
    static let body2XSSemiBold = getFont(.manropeSemiBold, 10)
    static let body2XSMedium = getFont(.manropeMedium, 10)
    static let body2XSRegular = getFont(.manropeRegular, 10)
}

extension Font {
    
    static func getFont(_ name: String, _ size: CGFloat) -> Font {
        return Font.custom(name, size: size)
    }
    
}
