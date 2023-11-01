//
//  MyTips.swift
//  App236
//
//  Created by IGOR on 26/10/2023.
//

import SwiftUI

struct MyTips: View {
    
    @StateObject var viewModel = MyTipsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 7, content: {
                        
                        Text("My tips")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom)
                        
                        if viewModel.tips.isEmpty {
                            
                            VStack(alignment: .center, spacing: 5, content: {
                                
                                Text("No Tips yet")
                                    .foregroundColor(.black)
                                    .font(.system(size: 23, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                
                                Text("All added tips will be here")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .multilineTextAlignment(.center)
                            })
                            .frame(maxHeight: .infinity, alignment: .center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: true) {
                                
                                LazyVStack {
                                    
                                    ForEach(viewModel.tips, id: \.self) { index in
                                        
                                        HStack(alignment: .top, content: {
                                            
                                            Text(Date().convertDate(format: "MMM d"))
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            VStack(alignment: .leading, spacing: 5, content: {
                                                
                                                Text(index.title ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                    .multilineTextAlignment(.leading)
                                                    .lineLimit(3)
                                                
                                                Text(index.text ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                    .multilineTextAlignment(.leading)
                                                    .lineLimit(3)
                                            })
                                            
                                            Spacer()
                                        })
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                                    }
                                }
                            }
                        }
                    })
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.isAdd = true
                    
                }, label: {
                    
                    Text("New Tip")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
        }
        .onAppear {
            
            viewModel.fetchTips()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddTips(viewModel: viewModel)
        })
    }
}

struct MyTips_Previews: PreviewProvider {
    static var previews: some View {
        MyTips()
    }
}
