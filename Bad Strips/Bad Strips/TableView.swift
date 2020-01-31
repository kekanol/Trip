//
//  TableView.swift
//  Bad Strips
//
//  Created by Константин Емельянов on 12.01.2020.
//  Copyright © 2020 Константин Емельянов. All rights reserved.
//

import SwiftUI

struct TableView: View {
    
    var Name: String = "SomeName"
    var image: String = "airplane"
    var count: Int = 0
    @Binding var detail: Bool
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "trash")
                    .frame(width: 25, height: 25)
                    .padding(.horizontal)
                    .opacity(0)
                Spacer()
                Rectangle()
                    .frame(width: 100.0, height: 5)
                    .cornerRadius(2)
                    .foregroundColor(Color("icons"))
                Spacer()
                
                Button(action: {self.detail.toggle()}) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color("icons"))
                        .padding(.horizontal)
                }
            }.padding(.vertical)
            HStack {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .padding(.horizontal)
                Text(Name)
                    .font(.largeTitle)
                Spacer()
                Text(String(count))
                    .padding(.horizontal)
            }
            List {
                EventCell()
                
            }
            VStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 1)
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                    Text("Добавить новое")
                        .font(.title)
                    Spacer()
                }.padding(.horizontal)
            }
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(detail: MainActivityCell().$detail)
    }
}

struct EventCell: View {
    @State var done: Bool = false
    var title: String = "nameOfEvent"
    var adress: String = "адрес"
    var body: some View {
        
        HStack {
            Button(action: {self.done.toggle()}) {
                Image(systemName: done ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(.trailing)
            }
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                Text(adress)
                    .font(.callout)
                    .foregroundColor(Color.gray)
            }
        }
    }
}
