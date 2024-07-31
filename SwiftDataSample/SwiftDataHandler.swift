//
//  SwiftDataHandler.swift
//  SwiftDataSample
//
//  Created by Yuki Kuwashima on 2024/07/31.
//

import SwiftData
import Foundation

public class SwiftDataHandler {

    public static let shared = SwiftDataHandler()

    public var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    public var modelContext: ModelContext

    init() {
        modelContext = ModelContext(sharedModelContainer)
    }

    func fetchAllItems() -> [Item] {
        let fetchDesc = FetchDescriptor<Item>(
            predicate: nil,
            sortBy: []
        )
        guard let fetchedDatas = try? modelContext.fetch(fetchDesc) else {
            print("error")
            return []
        }
        return fetchedDatas
    }
}
