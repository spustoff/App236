//
//  TipsModel.swift
//  App236
//
//  Created by IGOR on 26/10/2023.
//

import SwiftUI

struct TipsModel: Codable, Hashable {

    var results: [TipsItem]
}

struct TipsItem: Codable, Hashable {
    
    var resultId: Int?
    
    var resultTitle: String?
    var resultImage: String?
    
    var resultMark: String?
    var resultDateTime: String?
    
    var resultText: String?
    
    var resultTotalLikes: Int?
    var resultTotalComments: Int?
}
