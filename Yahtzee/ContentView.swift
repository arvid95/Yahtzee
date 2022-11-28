//
//  ContentView.swift
//  Yahtzee
//
//  Created by Arvid Axelsson on 2022-11-28.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = YahtzeeModel()
    
    var body: some View {
        NavigationStack {
         
            VStack {
                HStack {
                    Text("Rolls: \(model.rolls)")
                }
                HStack {
                    ForEach(model.dice) { dieModel in
                        DieView(model: dieModel)
                    }
                }
                .padding()
                
                Button {
                    model.roll()
                } label: {
                    Text("Roll Dice")
                }
                .buttonStyle(.borderedProminent)
                
                Grid {
                    GridRow {
                        Button {
                            model.check(section: .aces)
                        } label: {
                            Text("Aces")
                        }
                        Text("\(model.sections[.aces] ?? 0)")
                        Button {
                            model.check(section: .twos)
                        } label: {
                            Text("Twos")
                        }
                        Text("\(model.sections[.twos] ?? 0)")
                    }
                    .padding()
                    GridRow {
                        Button {
                            model.check(section: .threes)
                        } label: {
                            Text("Threes")
                        }
                        Text("\(model.sections[.threes] ?? 0)")
                        Button {
                            model.check(section: .fours)
                        } label: {
                            Text("Fours")
                        }
                        Text("\(model.sections[.fours] ?? 0)")
                    }
                    .padding()
                    GridRow {
                        Button {
                            model.check(section: .fives)
                        } label: {
                            Text("Fives")
                        }
                        Text("\(model.sections[.fives] ?? 0)")
                        Button {
                            model.check(section: .sixes)
                        } label: {
                            Text("Sixes")
                        }
                        Text("\(model.sections[.sixes] ?? 0)")
                    }
                    .padding()
                    
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
