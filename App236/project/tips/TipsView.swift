//
//  TipsView.swift
//  App236
//
//  Created by IGOR on 26/10/2023.
//

import SwiftUI

struct TipsView: View {
    
    @StateObject var viewModel = TipsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 7, content: {
                    
                    Text("Today tips")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .medium))
                    
                    if viewModel.isLoading {
                        
                        ProgressView()
                            .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        if viewModel.tips.isEmpty {
                            
                            VStack(alignment: .center, spacing: 5, content: {
                                
                                Text("Empty")
                                    .foregroundColor(.black)
                                    .font(.system(size: 23, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                
                                Text("No any tips")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .multilineTextAlignment(.center)
                            })
                            .frame(maxHeight: .infinity, alignment: .center)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: true) {
                                
                                LazyVStack {
                                    
                                    ForEach(viewModel.tips, id: \.self) { index in
                                        
                                        NavigationLink(destination: {
                                            
                                            TipsDetail(index: index)
                                                .navigationBarBackButtonHidden()
                                            
                                        }, label: {
                                            
                                            HStack(alignment: .top, content: {
                                                
                                                Text(index.resultDateTime ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text(index.resultTitle ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                    .multilineTextAlignment(.leading)
                                                    .lineLimit(3)
                                                
                                                Spacer()
                                            })
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                                        })
                                    }
                                }
                                .padding(.vertical)
                            }
                        }
                    }
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .onAppear {
            
            viewModel.getTips()
        }
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
