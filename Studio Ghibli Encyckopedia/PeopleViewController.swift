//
//  ViewController.swift
//  Studio Ghibli Encyckopedia
//
//  Created by administrator on 06/01/2022.
//

import UIKit

class PeopleViewController: UIViewController {
    @IBOutlet weak var tableViewPeople: UITableView!
    var people = People()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewPeople.delegate = self
        tableViewPeople.dataSource = self
        EncyclopediaModel.getData(with: "https://ghibliapi.herokuapp.com/people", completionHandler: {
            data, response, error in
            print("api initialized")
            print(data ?? "no data")
            guard let myData = data else { return }
            do {
                let decoder = JSONDecoder()
                let jsonResult = try decoder.decode(People.self, from: myData)
                self.people = jsonResult
                DispatchQueue.main.async {
                    self.tableViewPeople.reloadData()
                }
            }
            catch {
                print("error")
                print(error.localizedDescription)
            }
        })
    }
    
    //fetch data
//    func fetchPeople() {
//        let url = URL(string: "https://ghibliapi.herokuapp.com/people")
//        let session = URLSession.shared
//        let task = session.dataTask(with: url!, completionHandler: {
//            data, response, error in
//            print("api initialized")
//            print(data ?? "no data")
//            guard let myData = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                let jsonResult = try decoder.decode(People.self, from: myData)
//                self.people = jsonResult
//                DispatchQueue.main.async {
//                    self.tableViewPeople.reloadData()
//                }
//            }
//            catch {
//                print("error")
//                print(error.localizedDescription)
//            }
//        })
//        task.resume()
//    }
    
}

extension PeopleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(people.count)
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell")!
        cell.textLabel?.text = people[indexPath.row].name
        return cell
    }
}


