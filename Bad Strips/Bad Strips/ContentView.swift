//
//  ContentView.swift
//  Bad Strips
//
//  Created by Константин Емельянов on 04.12.2019.
//  Copyright © 2019 Константин Емельянов. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var show = false
    @State var isNavigationBarHidden: Bool = false
    @State var active = false
    var body: some View {
        
        NavigationView {
            VStack {
                FirstScreen()
                ScrollView(.vertical, showsIndicators: false) {
                    HStack {
                        Text("Следующая")
                            .font(.title)
                            .fontWeight(.regular)
                            .padding(.leading)
                        Spacer()
                    }
                    NavigationLink(destination: 
                        TabBar(isNavigationBarHidden: self.$isNavigationBarHidden, active: self.$active)
                            .navigationBarTitle("Hidden Title")
                            .navigationBarHidden(self.isNavigationBarHidden)
                            .onAppear {
                                self.isNavigationBarHidden = true
                        }, isActive: self.$active
                    ){
                        Button(action: {self.active.toggle()}) {
                        TripCard()
                        }
                    }
                    //                    Button(action: { self.show.toggle()}) {
                    //                        TripCard()
                    //                    }.sheet(isPresented: $show){
                    //                        TabBar().onAppear(){
                    //                        }
                    //                    }
                }
            }
            .animation(Animation.spring())
            .navigationBarTitle("MV")
            .navigationBarHidden(true)
        }        
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

