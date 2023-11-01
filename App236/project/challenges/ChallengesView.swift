//
//  ChallengesView.swift
//  App236
//
//  Created by IGOR on 26/10/2023.
//

import SwiftUI

struct ChallengesView: View {
    
    @StateObject var viewModel = ChallengesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 15, content: {
                    
                    HStack {
                        
                        Text("😊")
                            .font(.system(size: 23, weight: .semibold))
                            .padding(6)
                            .background(Circle().fill(.gray.opacity(0.2)))
                        
                        Text("Hey, \nIt's great day for a new challenge")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .multilineTextAlignment(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Total balance")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Text("$\(10000)")
                                .foregroundColor(.black)
                                .font(.system(size: 22, weight: .semibold))
                        })
                        
                        Spacer()
                        
                        Image("banknote")
                    }
                    .padding([.leading])
                    .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                })
                .padding([.horizontal, .top])
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 6, content: {
                                
                                Text("All Challanges")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("0")
                                    .foregroundColor(.black)
                                    .font(.system(size: 22, weight: .semibold))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 6, content: {
                                
                                Text("Profitable")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("$0.00")
                                    .foregroundColor(.black)
                                    .font(.system(size: 22, weight: .semibold))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Chellanges")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            NavigationLink(destination: {
                                
                                ChartView()
                                    .navigationBarBackButtonHidden()
                                
                            }, label: {
                                
                                Image("trade_img")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            })
                            
                            NavigationLink(destination: {}, label: {
                                
                                Image("investment_img")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            })
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.horizontal, .top])
                    }
                }
            }
        }
    }
}

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesView()
    }
}
