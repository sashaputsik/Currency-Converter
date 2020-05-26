import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var usdImageView: UIImageView!
    @IBOutlet weak var usdsCurrencyNameLabel: UILabel!
    @IBOutlet weak var usdCurrencyNameLabel: UILabel!
    @IBOutlet weak var usdEqultyLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var timeUpdateLabel: UILabel!
    var value: Float = 1.0
    var dateS = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        date()
        timeUpdateLabel.text = "Update: "+dateS
        valueTextField.text = "1"
        usdEqultyLabel.text = "1.0 USD = 1.0 USD"
        valueTextField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        usd()
        loadData {
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
    }
}

