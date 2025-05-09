//
//  Enum TextField States.swift
//  Tidoy App
//
//  Created by Mapple.pk on 09/05/2025.
//

import Foundation
import SwiftUI

enum TextFieldState {
    case normal, focus, filled, disable, error
}

extension TextFieldState {
    
    var borderColor: Color {
        switch self {
        case .normal, .filled, .disable:
            return .stroke40
        case .focus:
            return .strokeFocus
        case .error:
            return .strokeDanger
        }
    }
    var backgroundColor: Color {
        switch self {
        case .normal, .focus, .filled:
            return .background10
        case .disable:
            return .background20
        case .error:
            return .backgroundDanger
        }
    }
    
    var iconColor: Color {
        switch self {
        case .normal, .disable:
            return .icon60
        case .focus, .filled:
            return .icon100
        case .error:
            return .iconDanger
        }
    }
    var hintColor: Color {
        switch self {
        case .normal, .focus, .filled:
            return .text100
        case  .disable:
            return .text60
        case .error:
            return .textDanger
        }
    }
    var placeholderColor: Color {
        switch self {
        case .normal, .disable:
            return .text60
        case .focus, .filled:
            return .text100
        case .error:
            return .textDanger
        }
    }
    var labelColor: Color {
        switch self {
        case .normal, .disable, .focus, .filled:
            return .text100
        case .error:
            return .textDanger
        }
    }
    
}


