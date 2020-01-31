//
//  MainView.swift
//  Bad Strips
//
//  Created by Константин Емельянов on 05.12.2019.
//  Copyright © 2019 Константин Емельянов. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Cell.entity(), sortDescriptors: []) var cellData: FetchedResults<Cell>
    
    
    @Binding var active: Bool
    @Binding var isNavigationBarHidden: Bool

    var data = MainActivityData
    lazy var redoneData : [MainActivityDataModel] = fill(Ddata: data)
    
    func mut() -> [MainActivityDataModel] {
        var mutableself = self
        return mutableself.redoneData
    }
    var body: some View {
        
        
        NavigationView {
            VStack {
                TopButtons(active: self.$active, isNavigationBarHidden: self.$isNavigationBarHidden)
                
                ScrollView {
                    TopText()
                    FlightSection()
                    ActivityRow(firstCell: mut()[0], secondCell: mut()[1], thirdCell: mut()[2])
                    ActivityRow(firstCell: mut()[3], secondCell: mut()[4], thirdCell: mut()[5])
                    ActivityRow(firstCell: mut()[6], secondCell: mut()[7], thirdCell: mut()[8])
                    ActivityRow(firstCell: mut()[9], secondCell: mut()[10], thirdCell: mut()[12])
                    ActivityRow(firstCell: mut()[12], secondCell: mut()[13], thirdCell: mut()[14])
                    ActivityRow(firstCell: mut()[15], secondCell: mut()[16], thirdCell: mut()[17])
                    ActivityRow(firstCell: mut()[18], secondCell: mut()[19], thirdCell: mut()[20])
                    
                }
                Rectangle()
                    .frame(width:UIScreen.main.bounds.width, height: 1)
                    .opacity(0)
            }
            .background(Color("backgroundD"))
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        
    }
    
    
    
    func fill(Ddata: [MainActivityDataModel]) -> [MainActivityDataModel]{
        var RedoneData : [MainActivityDataModel] = []
        for item in Ddata {
            if item.showable == true {
                RedoneData.append(item)
            }
        }
        for item in Ddata {
            if item.showable == false {
                RedoneData.append(item)
            }
        }
        return RedoneData
    }
    
    
} 

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(active: ContentView().$show, isNavigationBarHidden: ContentView().$show)
    }
}



struct TopText: View {
    @State var showActivity = false
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Путешествие в")
                    .font(.headline)
                    .fontWeight(.regular)
                Text("Name")
                    .font(.title)
                    .fontWeight(.medium)
            }
            Spacer()
            Button(action: {self.showActivity.toggle()}) {
                AddNew() 
                    .sheet(isPresented: self.$showActivity) {
                        ActivityChoise(dismiss: self.$showActivity)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
        }
        .padding(.leading, 20.0)
        .padding(.trailing, 12)
    }
}

struct TopButtons: View {
    @Binding var active: Bool
    @Binding var isNavigationBarHidden: Bool
    var body: some View {
        HStack {
            Button(action: {self.active.toggle(); self.isNavigationBarHidden.toggle()}) {
                Image(systemName: "chevron.left.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
            }
            .frame(width: 25, height: 25)
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "person.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)

            }
            .frame(width: 25, height: 25)
            .padding(.trailing)
            
            Button(action: {}) {
                Image(systemName: "pencil")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)

            }
            .frame(width: 25, height: 25)
            
            
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(Color("backgroundD"))
        
    }
}


struct MainActivityCell: View {
    var image: String = "airplane"
    var title: String = "Самолёт"
    var showable: Bool = true
    @State var detail: Bool = false
    var count: Int = 1
    var body: some View {
        Button(action: {self.detail.toggle()}) {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Spacer()
                    Text("\(count)")
                        .font(.title)
                }.padding(.top, 5)
                Spacer()
                Text(title)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
                
            }
            .padding(12)
            .background(Color("icons"))
            .frame(minWidth: 0, maxWidth: 120, minHeight: 120.0, maxHeight: 120)
            .cornerRadius(20)
            .opacity(showable ? 1 : 0)
            .sheet(isPresented: self.$detail) {
                TableView(Name: self.title, image: self.image, count: self.count, detail: self.$detail)
            }
        }
      .buttonStyle(PlainButtonStyle())
    }
}

struct ActivityRow: View {
    var firstCell: MainActivityDataModel
    var secondCell: MainActivityDataModel
    var thirdCell: MainActivityDataModel
    var body: some View {
        HStack(spacing: 14) {
            MainActivityCell(image: firstCell.image, title: firstCell.title, showable: firstCell.showable, count: firstCell.count)
            MainActivityCell(image: secondCell.image, title: secondCell.title, showable: secondCell.showable, count: secondCell.count)
            MainActivityCell(image: thirdCell.image, title: thirdCell.title, showable: thirdCell.showable, count: thirdCell.count)
        }
        .padding(.horizontal, 11.0)
    }
}


struct MainActivityDataModel: Identifiable {
    var id = UUID()
    var showable: Bool
    var image: String
    var title: String
    var count: Int
}

let MainActivityData = [
    MainActivityDataModel(showable: true, image: "bed.double", title: "Жилье", count: 0),
    MainActivityDataModel(showable: false, image: "tuningfork", title: "Ресторан", count: 0),
    MainActivityDataModel(showable: true, image: "mappin.circle", title: "Место", count: 0),
    MainActivityDataModel(showable: false, image: "airplane", title: "Музей", count: 0),
    MainActivityDataModel(showable: true, image: "map", title: "Экскурсия", count: 0),
    MainActivityDataModel(showable: true, image: "person.2", title: "Встреча", count: 0),
    MainActivityDataModel(showable: true, image: "leaf.arrow.circlepath", title: "Отдых", count: 0),
    MainActivityDataModel(showable: false, image: "cart", title: "Шоппинг", count: 0),
    MainActivityDataModel(showable: true, image: "sportscourt", title: "Фитнес", count: 0),
    MainActivityDataModel(showable: false, image: "music.mic", title: "Концерт", count: 0),
    MainActivityDataModel(showable: true, image: "person.3", title: "Дети", count: 0),
    MainActivityDataModel(showable: true, image: "music.house", title: "Театр", count: 0),
    MainActivityDataModel(showable: true, image: "tv", title: "Кино", count: 0),
    MainActivityDataModel(showable: true, image: "airplane", title: "Прогулка", count: 0),
    MainActivityDataModel(showable: false, image: "flame", title: "Бар/Клуб", count: 0),
    MainActivityDataModel(showable: true, image: "captions.bubble", title: "Мероприятие", count: 0),
    MainActivityDataModel(showable: true, image: "airplane", title: "Паром", count: 0),
    MainActivityDataModel(showable: true, image: "airplane", title: "Автобус", count: 0),
    MainActivityDataModel(showable: true, image: "car", title: "Автомобиль", count: 0),
    MainActivityDataModel(showable: true, image: "tram.fill", title: "Поезд", count: 0),
    MainActivityDataModel(showable: false, image: "airplane", title: "Самолёт", count: 0)
]
