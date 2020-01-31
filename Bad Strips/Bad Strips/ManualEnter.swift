//
//  ManualEnter.swift
//  Bad Strips
//
//  Created by Константин Емельянов on 11.12.2019.
//  Copyright © 2019 Константин Емельянов. All rights reserved.
//

import SwiftUI

struct ManualEnter: View {
    @Binding var dismiss: Bool
    @State var name = ""
    @State var adress = ""
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "power")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                VStack{
                    TextField("Имя", text: $name)
                        .font(.title)
                    TextField("Адрес", text: $adress)
                    
                }
            }.padding()
            
            HStack(spacing: 20.0) {
                HStack {
                    VStack(alignment: .leading, spacing: 20.0) {
                        Image(systemName: "calendar")
                        Text("Начало")
                            .font(.headline)
                            .fontWeight(.regular)
                    }
                    Spacer()
                }
                .frame(minWidth: 0,maxWidth: 140, minHeight: 70, maxHeight: 70)
                .padding(20.0)
                .background(Color.gray)
                .cornerRadius(20)
                
                HStack {
                    VStack(alignment: .leading, spacing: 20.0) {
                        Image(systemName: "calendar")
                        Text("Конец")
                            .font(.headline)
                            .fontWeight(.regular)
                    }
                    Spacer()
                }
                .frame(minWidth: 0,maxWidth: 140, minHeight: 70, maxHeight: 70)
                .padding(20.0)
                .background(Color.gray)
                .cornerRadius(20)
                
            }
            
            HStack(spacing: 20.0) {
                HStack {
                    VStack(alignment: .leading, spacing: 20.0) {
                        Image(systemName: "phone")
                        Text("Телефон")
                            .font(.headline)
                            .fontWeight(.regular)
                    }
                    Spacer()
                }
                .frame(minWidth: 0,maxWidth: 140, minHeight: 70, maxHeight: 70)
                .padding(20.0)
                .background(Color.gray)
                .cornerRadius(20)
                
                HStack {
                    VStack(alignment: .leading, spacing: 20.0) {
                        Image(systemName: "safari")
                        Text("Веб-сайт")
                            .font(.headline)
                            .fontWeight(.regular)
                    }
                    Spacer()
                }
                .frame(minWidth: 0,maxWidth: 140, minHeight: 70, maxHeight: 70)
                .padding(20.0)
                .background(Color.gray)
                .cornerRadius(20)
                
            }
            
            HStack(spacing: 20.0) {
                
                VStack(alignment: .leading, spacing: 20.0) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Заметки")
                                .font(.headline)
                                .fontWeight(.regular)
                            Rectangle()
                                .frame(height: 3)
                                .foregroundColor(Color("background"))
                                
                            Text("Написать заметку")
                            Spacer()
                        }
                        Spacer()
                    }
                }
                .frame(minWidth: 0,maxWidth: 340, minHeight: 120, maxHeight: 120)
                .padding(20)
                .background(Color.gray)
                .cornerRadius(20)
                .padding(.top)
            }
            
            Spacer()
        }.padding(.horizontal)
    }
}

struct ManualEnter_Previews: PreviewProvider {
    static var previews: some View {
        ManualEnter(dismiss: TopText().$showActivity)
    }
}
