//
//  FirstScreen.swift
//  Bad Strips
//
//  Created by Константин Емельянов on 08.12.2019.
//  Copyright © 2019 Константин Емельянов. All rights reserved.
//

import SwiftUI

struct FirstScreen: View {
    @State var show = false
    var body: some View {
            TopView() 
    }  
    
}


struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}

struct TopView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 20.0) {
            Text("Ваши поездки")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            Spacer()
            Button(action: {}) {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .scaledToFit()
            }
            Button(action: {}) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .scaledToFit()
            }
            .padding(.trailing, 20)
        }
        .padding(.top, 10)
    }
}

struct TripCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("image")
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
            
            Text("Date")
                .foregroundColor(Color.black)
                .padding(.leading)
            Text("Name")
                .font(.title)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.leading)
                .padding(.leading)
            Text("S po")
                .foregroundColor(Color.black)
                .padding(.leading)
                .padding(.bottom)
        }
        .background(Color("background"))
        .cornerRadius(20)
        .padding(.horizontal, 20)
        .shadow(radius: 10)
    }
}

