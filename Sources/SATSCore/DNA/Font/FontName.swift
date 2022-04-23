//
//  FontName.swift
//  
//
//  Created by Oanh Tran on 22/04/2022.
//

import Foundation


public struct FontName {

    var name: String = ""

    init(name: String) {
        self.name = name
    }
}

struct InterFont {
    static let regular = FontName(name:"Inter-Regular")
    static let medium = FontName(name:"Inter-Medium")
    static let semiBold = FontName(name:"Inter-SemiBold")
    static let bold = FontName(name:"Inter-Bold")
}

struct HindFont {
    static let bold = FontName(name:"Hind-Bold")
    static let semiBold = FontName(name:"Hind-SemiBold")
    static let regular = FontName(name:"Hind-Regular")
    static let medium = FontName(name:"Hind-Medium")
}

struct UpdockFont {
    static let regular = FontName(name:"Updock-Regular")
}


