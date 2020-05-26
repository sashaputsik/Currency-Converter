import Foundation

func loadData(and complitionHandler: (()-> Void)?){
    guard let url = URL(string: url) else{return}
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
        var converter = Converter(dictionary: json)
        resultArray.append(converter)
    }
    converterArray = resultArray
    add()
}
