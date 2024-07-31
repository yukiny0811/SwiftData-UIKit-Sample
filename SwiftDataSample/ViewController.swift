//
//  ViewController.swift
//  SwiftDataSample
//
//  Created by Yuki Kuwashima on 2024/07/31.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items: [Item] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = String(items[indexPath.row].title + items[indexPath.row].date.formatted())
        return cell
    }
    

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        items = SwiftDataHandler.shared.fetchAllItems()
        tableView.reloadData()
    }

    @IBAction func add() {
        print("test")
        SwiftDataHandler.shared.modelContext.insert(Item(title: UUID().uuidString, date: Date()))
        items = SwiftDataHandler.shared.fetchAllItems()
        tableView.reloadData()
    }


}

