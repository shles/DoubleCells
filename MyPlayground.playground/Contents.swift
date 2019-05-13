/*
 Sample code to illustrate answer to question https://stackoverflow.com/questions/56113586/headercell-is-only-being-added-once-to-table-view/56114550?noredirect=1#comment98862914_56114550
 */
import UIKit
import PlaygroundSupport

class SectionsTableView : UIViewController, UITableViewDataSource {
    override func loadView() {
        let view = UITableView()
        view.backgroundColor = .white
        view.dataSource = self
        self.view = view
    }
    
    let data = [1,2,4,5,6]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(data[indexPath.section])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(data[section])"
    }
}

class CellsTableView : UIViewController, UITableViewDataSource {
    override func loadView() {
        let view = UITableView()
        view.backgroundColor = .white
        view.dataSource = self
        self.view = view
    }
    
    let data = [1,2,4,5,6]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count * 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(data[indexPath.row / 2])"
        if indexPath.row % 2 == 0 {
            cell.textLabel?.textColor = .red
        }
        return cell
        
    }
    
}
//Comment out one or another to see different approaches

PlaygroundPage.current.liveView = SectionsTableView()
//PlaygroundPage.current.liveView = CellsTableView()
