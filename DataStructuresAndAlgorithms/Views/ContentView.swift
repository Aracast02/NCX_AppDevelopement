//
//  ContentView.swift
//  DataStructuresAndAlgorithms
//
//  Created by Arantza Castro Dessavre on 22/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            VStack {
                Section {
                    List{
                        Section {
                            NavigationLink {
                                EmptyView()
                            } label: {
                                Text("Introduction")
                            }
                            
                            NavigationLink {
                                EmptyView()
                            } label: {
                                Text("Data Struchtures")
                            }
                        
                            NavigationLink {
                                EmptyView()
                            } label: {
                                Text("Algorithms")
                            }
                        }
                        
                        Section("Non-linear Data Structures"){
                            NavigationLink {
                                QueueView()
                            } label: {
                                Text("Queue")
                            }
                        }
                        
                        Section("Algorithms"){
                            NavigationLink {
                                EmptyView()
                            } label: {
                                Text("Introduction")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Learning")
        }
    }
}

#Preview {
    ContentView()
}
