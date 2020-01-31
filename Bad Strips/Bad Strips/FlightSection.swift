//
//  FlightSection.swift
//  Bad Strips
//
//  Created by Константин Емельянов on 05.12.2019.
//  Copyright © 2019 Константин Емельянов. All rights reserved.
//

import SwiftUI

struct FlightSection: View {
    var body: some View {
        VStack {
            HStack() {
                
                TripDate()
                Spacer()
                Map()
                
            }
            .padding(.horizontal, 11)
            
            Flight()
            
        }
        
    }
}

struct FlightSection_Previews: PreviewProvider {
    static var previews: some View {
        FlightSection()
    }
}

struct TripDate: View {
    var body: some View {
        VStack {
            HStack {
                Text("Маршрут")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.primary)
                
                Spacer()
                Text("N дней")
                    .font(.footnote)
                    .foregroundColor(Color.primary)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            Rectangle()
                .frame(minWidth: 0, maxWidth: 190, minHeight: 1, maxHeight: 1)
                .foregroundColor(.primary)
                .opacity(0.7)
            
            Spacer()
            
            HStack {
                Text("Начало")
                    .font(.subheadline)
                    .foregroundColor(Color.primary)
                
                Spacer()
                Text("Год")
                    .font(.subheadline)
                    .foregroundColor(Color.primary)
                
            }
            .padding(.horizontal)
            HStack {
                Text("1 date")
                    .font(.title)
                Spacer()
                Image(systemName: "arrow.right")
                Spacer()
                Text("2 date")
                    .font(.title)
            }
            .padding(.bottom)
            .padding(.horizontal)
        }
        .background(Color("icons"))
        .frame(minWidth: 0, maxWidth: 260, minHeight: 120.0, maxHeight: 120)
        .cornerRadius(20)
    }
}

struct Map: View {
    
    var body: some View {
        NavigationLink(destination: MaoViewContainer()) {
            VStack(alignment: .leading) {
                Image(systemName: "map")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Spacer()
                HStack {
                    Text("Карта")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(Color.primary)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.bottom)
            }
            .background(Color("icons"))
            .frame(minWidth: 0, maxWidth: 120, minHeight: 120.0, maxHeight: 120)
            .cornerRadius(20)
        }
    .buttonStyle(PlainButtonStyle())
    }
}

struct AddNew: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
            HStack {
                Text("Новое")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            Text("мероприятие")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
        }
        .padding(10)
        .frame(minWidth: 0, maxWidth: 120, minHeight: 110.0, maxHeight: 110)
        .background(Color("icons"))
        .cornerRadius(20)
    }
}

struct Flight: View {
    var showable: Bool = true
    var body: some View {
        HStack {
            
            Image(systemName: "airplane")
                .resizable()
                .scaledToFit()
                .padding(15)
                .padding(.leading)
            
            
            Text("Перелёты")
                .foregroundColor(.primary)
                .font(.title)
                .fontWeight(.regular)
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(Color("icons"))
        .cornerRadius(20)
        .padding(.horizontal, 11)
        .opacity(showable ? 1 : 0)
    }
}
