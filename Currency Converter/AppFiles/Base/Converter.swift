import Foundation

func loadData(){
    guard let url = URL(string: url) else{return}
    let session = URLSession.shared
    session.dataTask(with: url) { (data, response, error) in
        guard let data = data else {return}
        if let json = try? JSONSerialization.jsonObject(with: data, options: []){
            print(json)
        }
    }.resume()
}
