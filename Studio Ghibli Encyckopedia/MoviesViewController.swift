//
//  MoviesViewController.swift
//  Studio Ghibli Encyckopedia
//
//  Created by administrator on 06/01/2022.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableViewMovies: UITableView!
    var movies = Movies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMovies.delegate = self
        tableViewMovies.dataSource = self
        fetchMovies()
    }
    
    func fetchMovies() {
        let url = URL(string: "https://ghibliapi.herokuapp.com/films")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: {
            data, response, error in
            print("api initialized")
            print(data ?? "no data")
            guard let myData = data else { return }
            do {
                let decoder = JSONDecoder()
                let jsonResult = try decoder.decode(Movies.self, from: myData)
                self.movies = jsonResult
                DispatchQueue.main.async {
                    self.tableViewMovies.reloadData()
                }
            }
            catch {
                print("error")
                print(error.localizedDescription)
            }
        })
        task.resume()
    }

}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviesCell")!
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }
    
    
}
