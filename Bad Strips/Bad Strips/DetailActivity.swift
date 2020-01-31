//
//  DetailActivity.swift
//  Bad Strips
//
//  Created by Константин Емельянов on 10.12.2019.
//  Copyright © 2019 Константин Емельянов. All rights reserved.
//

import SwiftUI

struct DetailActivity: View {
    @State var Place: String = ""
    @Binding var dismiss: Bool
    var title: String
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                TextField("Место", text: $Place)
                    .font(.title)
                    .padding(.horizontal)
            }.padding(.horizontal)
            
            Rectangle()
                .foregroundColor(Color("background"))
                .frame(height: 3)
                .padding(.vertical, 3)
            
            
          
                NavigationLink(destination: ManualEnter(dismiss: self.$dismiss)
                    .navigationBarTitle(Text(self.title)
                        .font(.subheadline))
                    .navigationBarItems(
                        trailing: Button(action: {self.dismiss.toggle()}) {
                            Text("Сохранить")
                    })) {
                        
                        Text("Ввести вручную")
                            .font(.headline) 
                            .padding()
                            .foregroundColor(.blue)
                            .frame(minWidth: 0,  maxWidth: .infinity)
                }
            .frame(height: 60)
            Spacer()
        }
        .navigationBarTitle(Text(self.title))
        .navigationBarItems(
            trailing: Button(action: {self.dismiss.toggle()}) {
                Text("Отмена")
        })
    }
}



struct DetailActivity_Previews: PreviewProvider {
    static var previews: some View {
        DetailActivity(dismiss: TopText().$showActivity, title: "h")
    }
}
