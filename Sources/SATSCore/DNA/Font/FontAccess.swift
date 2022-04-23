//
//  File.swift
//  
//
//  Created by Oanh Tran on 22/04/2022.
//

import Foundation
import UIKit

private enum Inter: String, CaseIterable {
    case regular = "Inter-Regular"
    case medium = "Inter-Medium"
    case semiBold = "Inter-SemiBold"
    case bold = "Inter-Bold"
}

private enum Hind: String, CaseIterable {
    case regular = "Hind-Regular"
    case medium = "Hind-Medium"
    case semiBold = "Hind-SemiBold"
    case bold = "Hind-Bold"
}

private enum Updock: String, CaseIterable {
    case regular = "Updock-Regular"
}


public struct FontAccess {
    
    public static func registerCustomFonts() {
        Inter.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
        }
        Hind.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
        }
        Updock.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
        }
    }
    
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
    
    public static func font(
        font: FontName,
        textStyle:UIFont.TextStyle,
        size: CGFloat) -> UIFont {
            
            guard let customFont = UIFont(
                name: font.name,
                size: size)
            else {
                let descriptor = UIFontDescriptor
                    .preferredFontDescriptor(withTextStyle: textStyle)
                return UIFont(descriptor: descriptor, size: descriptor.pointSize)
            }
            return customFont.dynamicallyTyped(withStyle: textStyle)
    }
}


extension UIFont {
    func dynamicallyTyped(withStyle style: UIFont.TextStyle) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: style)
        return metrics.scaledFont(for: self)
    }
    
}


