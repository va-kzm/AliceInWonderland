//
//  FetchVC.swift
//  aliceInWonderland
//
//  Created by Mokhamad Valid Kazimi on 27.03.2018.
//  Copyright © 2018 Mokhamad Valid Kazimi. All rights reserved.
//

import UIKit

class FetchVC: UIViewController {
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Properties
    var storedText = ""
    var counts: [Character: Int] = [:]
    var keysArray = [Character]()
    var valuesArray = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //arr.forEach { counts[$0, default: 0] += 1 }
    
    // Methods
    func countOccurence(ofCharactersIn text: String) {
        for i in storedText {
            counts[i, default: 0] += 1
        }
        
        for key in counts.keys.sorted() {
            keysArray.append(key)
            valuesArray.append(counts[key]!)
        }
        
        print(counts)
        print(keysArray)
        print(valuesArray)
    }
    
    // Actions
    @IBAction func fetchTextPressed(_ sender: Any) {
        AuthService.instance.fetchText({ (fetchedText) in
            self.storedText = fetchedText
        }) { (success) in
            if success {
                self.countOccurence(ofCharactersIn: self.storedText)
                self.tableView.reloadData()
                self.tableView.isHidden = false
            }
        }
    }
}

extension FetchVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_CELL_ID, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.configureCell(withCharacters: keysArray[indexPath.row], andCountOfOccurence: valuesArray[indexPath.row])
        return cell
    }
}
