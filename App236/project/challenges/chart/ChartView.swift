//
//  ChartView.swift
//  App236
//
//  Created by IGOR on 26/10/2023.
//

import SwiftUI

struct ChartView: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Price movement forecast")
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
                
                HStack {
                    
                    Text("\(Int.random(in: 1...25555))")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    Text("Balance: $\(10000)")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                }
                .padding([.horizontal])
                
                TradeChart(pair: "EURUSD")
                    .disabled(true)
                
                HStack {
                    
                    Button(action: {}, label: {
                        
                        Text("Up")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.green))
                    })
                    
                    Button(action: {}, label: {
                        
                        Text("Down")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.red))
                    })
                }
                .padding()
                .overlay (
                
                    Text("Will available in 10 hours")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .background(Color.black.opacity(0.4))
                )
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
