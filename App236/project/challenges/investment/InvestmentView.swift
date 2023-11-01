//
//  InvestmentView.swift
//  App236
//
//  Created by IGOR on 26/10/2023.
//

import SwiftUI

struct InvestmentView: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Future-proof investment")
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
                
                Text("Choose the most profitable investment and make a forecast")
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .regular))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        ForEach(["Gazprom", "Samokat"], id: \.self) { index in
                            
                            VStack(spacing: 20) {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 19, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Text("+\(Int.random(in: 1...25))%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(7)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                                }
                                
                                HStack {
                                    
                                    Text("Min participation rate")
                                        .foregroundColor(.black)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Text("$\(800)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                HStack {
                                    
                                    Text("Expected return")
                                        .foregroundColor(.black)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Text("10,2-11,1%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Make forecast")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
        }
    }
}

struct InvestmentView_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentView()
    }
}
