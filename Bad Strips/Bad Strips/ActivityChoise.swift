//
//  ActivityChoise.swift
//  Bad Strips
//
//  Created by Константин Емельянов on 06.12.2019.
//  Copyright © 2019 Константин Емельянов. All rights reserved.
//

import SwiftUI

struct ActivityChoise: View {
    
    @Binding var dismiss: Bool
    var Celldata = Data 
    
    var body: some View {
        
        
        NavigationView {
            
            VStack {
                ScrollView {
                    
                    ForEach(Celldata) { row in
                        HStack(spacing: 10.0) {
                            
                            
                            NavigationLink(destination: DetailActivity(dismiss: self.$dismiss, title: row.data1.title)
                                .navigationBarItems(
                                    trailing: Button(action: {self.dismiss.toggle()}) {
                                        Text("Отмена")
                                })
                            ) {
                                ActivityCell(image: row.data1.image, title: row.data1.title)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            
                            
                            NavigationLink(destination: DetailActivity(dismiss: self.$dismiss, title: row.data2.title)
                                .navigationBarItems(
                                    trailing: Button(action: {self.dismiss.toggle()}) {
                                        Text("Отмена")
                                })
                            ) {
                                ActivityCell(image: row.data2.image, title: row.data2.title)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            
                            
                            NavigationLink(destination: DetailActivity(dismiss: self.$dismiss, title: row.data3.title)
                                .navigationBarItems(
                                    trailing: Button(action: {self.dismiss.toggle()}) {
                                        Text("Отмена")
                                })
                            ) {
                                ActivityCell(image: row.data3.image, title: row.data3.title)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            
                        }
                        .padding(.horizontal, 10)
                    }
                    .padding(.vertical)
                }
                .background(Color.gray)
                .navigationBarTitle(Text("Новое мероприятие"))
                .navigationBarItems(trailing: Button(action: {self.dismiss.toggle()}) {
                    Text("Отмена")
                })
                    .padding(.vertical)
                
            }
            
        }
    }  
}





struct ActivityChoise_Previews: PreviewProvider {
    static var previews: some View {
        ActivityChoise(dismiss: TopText().$showActivity)
    }
}

struct ActivityCell: View {
    var image: String = "airplane"
    var title: String = "Самолёт"
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Spacer()
            }.padding(.top, 5)
            Spacer()
            Text(title)
                .font(.caption)
                .fontWeight(.regular)
        }
        .padding(12)
        .frame(minWidth: 0, maxWidth: 140, minHeight: 110.0, maxHeight: 110)
        .background(Color.white)
        .cornerRadius(20)
    }
    
}

struct ActivityData: Identifiable {
    var id = UUID()
    var image: String
    var title: String
}

struct row: Identifiable {
    var id = UUID()
    var data1: ActivityData
    var data2: ActivityData
    var data3: ActivityData
    
}




let Data = [
    row(
        data1: ActivityData(image: "airplane", title: "Самолёт"), 
        data2: ActivityData(image: "bed.double", title: "Жилье"), 
        data3: ActivityData(image: "tuningfork", title: "Ресторан")
    ),
    row(
        data1: ActivityData(image: "mappin.circle", title: "Место"), 
        data2: ActivityData(image: "airplane", title: "Музей"), 
        data3: ActivityData(image: "map", title: "Экскурсия")
    ),
    row(
        data1: ActivityData(image: "person.2", title: "Встреча"), 
        data2: ActivityData(image: "leaf.arrow.circlepath", title: "Отдых"), 
        data3: ActivityData(image: "cart", title: "Шоппинг")),
    row(
        data1: ActivityData(image: "sportscourt", title: "Фитнес"), 
        data2: ActivityData(image: "music.mic", title: "Концерт"), 
        data3: ActivityData(image: "person.3", title: "Дети")),
    row(
        data1: ActivityData(image: "music.house", title: "Театр"), 
        data2: ActivityData(image: "tv", title: "Кино"), 
        data3: ActivityData(image: "airplane", title: "Прогулка")),
    row(
        data1: ActivityData(image: "flame", title: "Бар/Клуб"), 
        data2: ActivityData(image: "captions.bubble", title: "Мероприятие"), 
        data3: ActivityData(image: "airplane", title: "Паром")),
    row(
        data1: ActivityData(image: "airplane", title: "Автобус"), 
        data2: ActivityData(image: "car", title: "Автомобиль"), 
        data3: ActivityData(image: "tram.fill", title: "Поезд")
    )
    
]
