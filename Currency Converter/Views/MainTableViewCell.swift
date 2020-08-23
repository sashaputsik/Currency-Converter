
import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyImageView: UIImageView!
    @IBOutlet weak var sNameOfCurrencyLabel: UILabel!
    @IBOutlet weak var valueCurrencyLabel: UILabel!
    @IBOutlet weak var equeltyCurrencyLabel: UILabel!
    @IBOutlet weak var nameOfCurrencyLabel: UILabel!
    @IBOutlet weak var valueChangeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setCurrency(one: Float, indexPath: IndexPath, value: Float){
        currencyImageView.image = UIImage(named: DataSource().imageName[indexPath.row])
        valueCurrencyLabel.text = "\(currencyArray[indexPath.row].floatValue*value)"
        nameOfCurrencyLabel.text = DataSource().currencyName[indexPath.row]
        sNameOfCurrencyLabel.text = DataSource().sCurrencyName[indexPath.row]
        equeltyCurrencyLabel.text = "1 \(DataSource().sCurrencyName[indexPath.row]) = \(one) USD"
    }
    func setHistoryCurrency(indexPath: IndexPath){
        currencyImageView.image = UIImage(named: DataSource().imageName[indexPath.row])
        nameOfCurrencyLabel.text = DataSource().currencyName[indexPath.row]
        sNameOfCurrencyLabel.text = DataSource().sCurrencyName[indexPath.row]
        valueCurrencyLabel.text = "\(historyCurrencyArray[indexPath.row].floatValue)"
    }

}
