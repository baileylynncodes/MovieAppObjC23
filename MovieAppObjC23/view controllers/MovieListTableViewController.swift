//
//  MovieListTableViewController.swift
//  MovieAppObjC23
//
//  Created by Karissa McDaris on 12/21/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movies: [BMMovie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movies = self.movies[indexPath.row]
        cell.movies = movies
        return cell
    }
}

extension MovieListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let textInSearchBar = searchBar.text, !textInSearchBar.isEmpty else {return}
        BMMovieController.fetchAllMovies(withTitle: textInSearchBar) { (movies) in
            guard let movies = movies else {return}
            DispatchQueue.main.async {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
    }
}
