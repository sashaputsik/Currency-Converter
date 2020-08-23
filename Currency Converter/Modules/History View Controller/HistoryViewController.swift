import UIKit

class HistoryViewController: UIViewController {
        @IBOutlet private(set) var datePicker: UIDatePicker!
        @IBOutlet private(set) var tableView: UITableView!
        var dateString = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        datePicker.addTarget(self,
                             action: #selector(dateChange),
                             for: .valueChanged)
        datePicker.maximumDate = Date()
        Parse().loadHistory(of: dateString) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func dateChange(){
        let dateF = DateFormatter()
        dateF.dateFormat = "yyyy-MM-dd"
        dateString = dateF.string(from: datePicker.date)
        let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory,
                                                       .userDomainMask, true)[0]+"/historyData.json"
        try? FileManager.default.removeItem(atPath: path)
        historyCurrencyArray.removeAll()
        Parse().loadHistory(of: dateString) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
