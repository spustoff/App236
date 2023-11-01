//
//  TipsDetail.swift
//  App236
//
//  Created by IGOR on 26/10/2023.
//

import SwiftUI

struct TipsDetail: View {
    
    let index: TipsItem
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .bold))
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                WebPic(urlString: index.resultImage ?? "", width: .infinity, height: 200, cornerRadius: 0, isPlaceholder: true)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(alignment: .leading) {
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text(index.resultDateTime ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text(index.resultTitle ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 24, weight: .regular))
                            
                            Text(index.resultText ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.leading)
                        })
                    }
                    .padding()
                }
            }
        }
    }
}

struct TipsDetail_Previews: PreviewProvider {
    static var previews: some View {
        TipsDetail(index: TipsItem(resultId: 0, resultTitle: "dsa", resultImage: "", resultMark: "fdsopk", resultDateTime: "fsdop", resultText: "fpdsokfopdsfpods", resultTotalLikes: 1, resultTotalComments: 2))
    }
}
