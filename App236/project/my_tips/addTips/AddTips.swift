//
//  AddTips.swift
//  App236
//
//  Created by IGOR on 26/10/2023.
//

import SwiftUI

struct AddTips: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: MyTipsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .bold))
                            .padding(6)
                            .background(Circle().fill(.gray.opacity(0.2)))
                    })
                    
                    Text("Create Tip")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                    
                    Button(action: {
                        
                        viewModel.addTip {
                            
                            router.wrappedValue.dismiss()
                            
                            viewModel.fetchTips()
                        }
                        
                    }, label: {
                        
                        Text("Done")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16, weight: .medium))
                    })
                    .opacity(viewModel.title.isEmpty || viewModel.text.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.title.isEmpty || viewModel.text.isEmpty ? true : false)
                }
                .padding([.horizontal, .top, .bottom])
                .padding(.top)
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Title")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                        .opacity(viewModel.title.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.title)
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                })
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                .padding(.horizontal)
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Text")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                        .opacity(viewModel.text.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.text)
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                })
                .padding()
                .frame(maxHeight: .infinity, alignment: .top)
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                .padding([.horizontal, .bottom])
            }
        }
    }
}

struct AddTips_Previews: PreviewProvider {
    static var previews: some View {
        AddTips(viewModel: MyTipsViewModel())
    }
}
