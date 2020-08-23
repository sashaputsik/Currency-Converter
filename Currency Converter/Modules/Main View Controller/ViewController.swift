import UIKit
import TweeTextField
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var usdImageView: UIImageView!
    @IBOutlet weak var usdsCurrencyNameLabel: UILabel!
    @IBOutlet weak var usdCurrencyNameLabel: UILabel!
    @IBOutlet weak var usdEqultyLabel: UILabel!
    @IBOutlet weak var valueTextField: TweeActiveTextField!
    @IBOutlet weak var timeUpdateLabel: UILabel!
    var refreshControl: UIRefreshControl!
    @IBOutlet weak var calculatorBackView: UIView!
    var value: Float = 1.0
    var dateS = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        date()
        refresher()
        frame()
        tableView.addSubview(refreshControl)
        valueTextField.text = "1"
        usdEqultyLabel.text = "1.0 USD = 1.0 USD"
        valueTextField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        usd()
        Parse().loadData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    func usd(){
        usdImageView.image = UIImage(named: "Dollar.png")
        usdsCurrencyNameLabel.text = "USD"
        usdCurrencyNameLabel.text = "American Dollar"
       
    }
    func date(){
        let date = Date()
        let f = DateFormatter()
        f.dateFormat = "dd.MM-hh.mm"
        dateS = f.string(from: date)
        timeUpdateLabel.text = "Update: "+dateS
    }
    func refresher(){
        let refresh = UIRefreshControl()
        refresh.addTarget(self,
                          action: #selector(refresingCurrency),
                          for: .valueChanged)
        //refresh.endRefreshing()
        refreshControl = refresh
        
    }
    @objc func refresingCurrency(){
        let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory,
                                                       .userDomainMask, true)[0]+"/data.json"
        try? FileManager.default.removeItem(atPath: path)
        currencyArray.removeAll()
        Parse().loadData {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        
        }
    }
        date()
        print(currencyArray)
        
    }
    func frame(){
        calculatorBackView.layer.cornerRadius = 10
    }
}
