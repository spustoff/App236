//
//  StatisticsView.swift
//  App236
//
//  Created by IGOR on 26/10/2023.
//

import SwiftUI

struct StatisticsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
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
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                        
                        Text("All Challanges")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                        
                        Text("0")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                    
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
                
                Circle()
                    .stroke(Color("primary"), lineWidth: 20)
                    .frame(width: 233, height: 233)
                    .overlay (
                    
                        Text("0")
                            .foregroundColor(.black)
                            .font(.system(size: 41, weight: .bold))
                    )
                    .padding(.vertical, 75)
                
                Spacer()
            }
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
