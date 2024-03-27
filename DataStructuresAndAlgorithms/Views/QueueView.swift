//
//  QueueView.swift
//  DataStructuresAndAlgorithms
//
//  Created by Arantza Castro Dessavre on 27/03/24.
//

import SwiftUI

class QueueModel: ObservableObject {
    @Published var queue: Queue<String> = Queue<String>()
    private var currentIndex = 1

    func enqueueNextCarro() {
        queue.enqueue("Carro\(currentIndex)")
        currentIndex = currentIndex % 9 + 1
    }
}

struct QueueView: View {
    private var size = UIScreen.main.bounds.size
    @StateObject private var queueModel = QueueModel()
    @State private var cars = [String()]
    
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button(action: {
                        queueModel.queue.dequeue()
                        cars = queueModel.queue.allElements()
                    }, label: {
                        Text("Dequeue")
                    })
                    .buttonStyle(.bordered)
                    
                    Button(action: {
                            queueModel.enqueueNextCarro()
                            cars = queueModel.queue.allElements()
                    }, label: {
                        Text("Enqueue")
                    })
                    .buttonStyle(.bordered)
                
                    Button(action: {
                        
                    }, label: {
                        Text("Create node")
                    })
                    .buttonStyle(.bordered)
                }
                .padding(.all)
                
                Spacer()
                
                Group{
                    ZStack(alignment: .leading){
                        
                        Image("GasPump")
                            .padding(.trailing, size.width - 400)
                            .padding(.bottom, size.height - 900)
                        if queueModel.queue.isEmpty {
                             HStack {
                                 Spacer()
 
                                 Text("The queue is empty")
                                     .font(.title)
                                 .bold()
                                 Spacer()
                             }
                             .frame(width: size.width)
                        } else {
                                HStack{
                                    ForEach(cars, id: \.self){car in
                                        Image(car)
                                            .padding(.horizontal)
                                    }
                                }
                                .padding(.trailing, size.width - 400)
                        }
                        
                    }
                }
                
                Spacer()
                
            }
        }
    }

}



#Preview {
    QueueView()
}
