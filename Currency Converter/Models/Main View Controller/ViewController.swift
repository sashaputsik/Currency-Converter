import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


}

