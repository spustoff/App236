//
//  TipsViewModel.swift
//  App236
//
//  Created by IGOR on 26/10/2023.
//

import SwiftUI
import Alamofire

final class TipsViewModel: ObservableObject {
        
    @Published var likes: Int = 0
    
    @AppStorage("news_goal") var news_goal: Int = 0

    @Published var isLoading: Bool = false
    
    @Published var tips: [TipsItem] = []
    
    @Published var isDetail: Bool = false
    @Published var selectedPaper: TipsItem?
    
    @AppStorage("readed") var readed: Int = 0
    
    
    func fetchTips(completion: @escaping (Result<TipsModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "8ea7b7af-89aa-4a7e-9a44-05fcbf5204e3",
        ]
        
        let request = AF.request("https://kerewap.space/api/v2/news", method: .get, parameters: params)
        
        request.responseDecodable(of: TipsModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result {
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
    
    func getTips() {
        
        isLoading = true
        
        self.fetchTips { result in
            
            switch result {
                
            case .success(let success):
                
                self.tips = success.results
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
}

