//
//  ContentView.swift
//  SwiftDataSandbox
//
//  Created by gurrium on 2024/04/15.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var shop: Shop?

    var body: some View {
        Group {
            if let shop {
                List {
                    Section(shop.name) {
                        ForEach(shop.items) { item in
                            Text("\(item.timestamp)")
                        }
                    }
                }
            }
        }
        .onAppear {
            guard shop == nil else { return }

            let shop = Shop(name: "A")
            modelContext.insert(shop)

            let newItem = Item(timestamp: Date())
            newItem.shop = shop

            let highlightedItem = Item(timestamp: Date().addingTimeInterval(-3600))
            shop.highlightedItem = highlightedItem

            modelContext.insert(highlightedItem)
            modelContext.insert(newItem)

            self.shop = shop
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
