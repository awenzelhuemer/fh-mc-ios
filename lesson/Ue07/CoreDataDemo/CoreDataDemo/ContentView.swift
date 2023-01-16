//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by Andreas Wenzelhuemer on 12.01.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @State var goodGuy: Bool = true
    @State var name: String = ""
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)],
        predicate: NSPredicate(format: "goodGuy == %@",  NSNumber(value: false)),
        animation: nil
    ) var characters: FetchedResults<Character>
    
    var body: some View {
        VStack {
                TextField("Name", text: $name)
                Toggle("Good guy?", isOn: $goodGuy)
                Button("Add character") {
                    let character = Character(context: moc)
                    character.name = name
                    character.goodGuy = goodGuy
                    
                    do {
                        try moc.save()
                        goodGuy = true
                        name = ""
                        print("Saved!")
                    } catch {
                        moc.rollback()
                        print("Failed to save person : \(error)")
                    }
                }
            List(characters) { character in
                Text("\(character.name!) (\(character.goodGuy ? "good" : "bad"))")
            }.listStyle(.plain)
            Spacer()
        }.padding()    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
