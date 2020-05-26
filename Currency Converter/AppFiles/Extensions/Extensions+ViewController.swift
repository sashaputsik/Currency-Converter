import Foundation
import UIKit

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as? mainTableViewCell{
            cell.currencyImageView.image = UIImage(named: DataSource().imageName[indexPath.row])
            cell.valueCurrencyLabel.text = "\(currencyArray[indexPath.row].floatValue*value)"
            cell.nameOfCurrencyLabel.text = DataSource().currencyName[indexPath.row]
            cell.sNameOfCurrencyLabel.text = DataSource().sCurrencyName[indexPath.row]
            let one = 1/currencyArray[indexPath.row].floatValue
            cell.equeltyCurrencyLabel.text = "1 \(DataSource().sCurrencyName[indexPath.row]) = \(one) USD"
        return cell
    }
        return UITableViewCell()
    }
    
    
}
extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

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
