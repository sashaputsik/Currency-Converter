import Foundation

func loadData(and complitionHandler: (()-> Void)?){
    guard let url = URL(string: currentUrl) else{return}
    let session = URLSession.shared
    session.downloadTask(with: url) { (dataFile, response, error) in
        let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
        guard let data = dataFile else{return}
        let urlPath = URL(fileURLWithPath: path)
        try? FileManager.default.copyItem(at:data, to: urlPath)
        purseJson()
        complitionHandler?()
    }.resume()
}

func purseJson(){
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    var resultArray = [Converter]()
    guard let data = try? Data(contentsOf: urlPath) else{return}
    if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String,Any>{
        let converter = Converter(dictionary: json)
        resultArray.append(converter)
    }
    converterArray = resultArray
    add()
   
   
}
func loadHistory(of date: String, complitionHandler: (()->Void)?){
    guard let url = URL(string: "http://api.currencylayer.com/historical?access_key=7b3227866aebfd9080832df2d7371022&date=\(date)&currencies=USD,AUD,CAD,PLN,MXN&format=1") else{return}
    let session = URLSession.shared
    session.downloadTask(with: url) { (data, response, error) in
        guard let data = data else{return}
        let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory,
                                                       .userDomainMask, true)[0]+"/historyData.json"
        let urlPath = URL(fileURLWithPath: path)
        try? FileManager.default.copyItem(at: data,
                                          to: urlPath)
        parseHistoryJson()
        addHistory()
        complitionHandler?()
    }.resume()
}
func parseHistoryJson(){
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory,
                                                   .userDomainMask, true)[0]+"/historyData.json"
    let urlPath = URL(fileURLWithPath: path)
    guard let data = try? Data(contentsOf: urlPath) else{return}
    if let json = try? JSONSerialization.jsonObject(with: data,
                                                    options: .allowFragments) as? Dictionary<String,Any>{
        print(json)
        let converter = Converter(dictionary: json)
        converterArray.append(converter)
        }
}
