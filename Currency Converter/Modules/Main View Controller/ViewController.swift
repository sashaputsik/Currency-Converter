import UIKit
import TweeTextField
class ViewController: UIViewController {

    @IBOutlet private(set) var tableView: UITableView!
    @IBOutlet private(set) var usdImageView: UIImageView!
    @IBOutlet private(set) var usdsCurrencyNameLabel: UILabel!
    @IBOutlet private(set) var usdCurrencyNameLabel: UILabel!
    @IBOutlet private(set) var usdEqultyLabel: UILabel!
    @IBOutlet private(set) var valueTextField: TweeActiveTextField!
    @IBOutlet private(set) var timeUpdateLabel: UILabel!
    @IBOutlet private(set) var calculatorBackView: UIView!
    private(set) var refreshControl: UIRefreshControl!
    public var value: Float = 1.0
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorBackView.layer.cornerRadius = Appearance().cornerRadius
        date()
        refresher()
        tableView.addSubview(refreshControl)
        let dismissKeyboard = UITapGestureRecognizer(target: self,
                                                     action: #selector(setDismissKeyboard))
        view.addGestureRecognizer(dismissKeyboard)
        Parse().loadData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: Handler
    @objc
    private func refresingCurrency(){
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
    }
    @objc
    private func setDismissKeyboard(){
        valueTextField.endEditing(true)
        view.resignFirstResponder()
    }
}

//MARK: Extension ViewController
extension ViewController{
    private struct Appearance {
        let cornerRadius: CGFloat = 10
    }
    
    func date(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MMM, hh.mm"
        timeUpdateLabel.text = "Update: " + dateFormatter.string(from: Date())
    }
    
    
    func refresher(){
        let refresh = UIRefreshControl()
        refresh.addTarget(self,
                          action: #selector(refresingCurrency),
                          for: .valueChanged)
        refreshControl = refresh
    }
}
