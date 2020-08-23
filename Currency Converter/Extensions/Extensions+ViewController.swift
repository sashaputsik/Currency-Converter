import Foundation
import UIKit
//MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return currencyArray.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.id,
                                                       for: indexPath) as? MainTableViewCell else{ return UITableViewCell()}
        let one = currencyArray[indexPath.row].floatValue
        cell.setCurrency(one: one, indexPath: indexPath, value: value)
        return cell
    }
}

//MARK: UITableViewDelegate
extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath,
                              animated: true)
    }
    
}

//MARK: UITextFieldDelegate
extension ViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        usdEqultyLabel.text = "\(valueTextField.text!).0 USD = \(valueTextField.text!).0 USD"
        value = (textField.text as NSString?)!.floatValue
        if textField.text == ""{
            value = 1.0
        }
        tableView.reloadData()
    }
    
}
