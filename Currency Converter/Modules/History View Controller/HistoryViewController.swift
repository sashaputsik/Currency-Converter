import UIKit

class HistoryViewController: UIViewController {
        @IBOutlet weak var datePicker: UIDatePicker!
        @IBOutlet weak var tableView: UITableView!
        @IBOutlet weak var currentTimeLabel: UILabel!
        var dateString = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        addedCurrentDate()
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
            print(historyCurrencyArray)
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
            print(historyCurrencyArray)
        }
    }
    func addedCurrentDate(){
        let date = Date()
        let dateF = DateFormatter()
        dateF.dateFormat = "YYYY.MM.dd"
        currentTimeLabel.text = "Current Date: "+dateF.string(from: date)
    }
}
