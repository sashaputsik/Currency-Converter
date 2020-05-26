import Foundation
import UIKit
extension HistoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyCurrencyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? mainTableViewCell{
            cell.currencyImageView.image = UIImage(named: DataSource().imageName[indexPath.row])
            cell.nameOfCurrencyLabel.text = DataSource().currencyName[indexPath.row]
            cell.sNameOfCurrencyLabel.text = DataSource().sCurrencyName[indexPath.row]
            cell.valueCurrencyLabel.text = "\(historyCurrencyArray[indexPath.row].floatValue)"
            cell.equeltyCurrencyLabel.font = UIFont.boldSystemFont(ofSize: 20)
            if currencyArray[indexPath.row].floatValue > historyCurrencyArray[indexPath.row].floatValue{
                cell.equeltyCurrencyLabel.text = "+"
                cell.equeltyCurrencyLabel.textColor = .red
            }
            else if currencyArray[indexPath.row].floatValue < historyCurrencyArray[indexPath.row].floatValue{
                cell.equeltyCurrencyLabel.text = "-"
                cell.equeltyCurrencyLabel.textColor = .green
            }
            else{
                cell.equeltyCurrencyLabel.text = "="
                cell.equeltyCurrencyLabel.textColor = .black
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
}
extension HistoryViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
