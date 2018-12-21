//
//  MovieTableViewCell.swift
//  MovieAppObjC23
//
//  Created by Karissa McDaris on 12/21/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var movies: BMMovie? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieSummaryLabel: UILabel!
    
    
    func updateViews() {
        guard let movie = movies else {return}
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = "\(movie.rating)"
        movieSummaryLabel.text = movie.summary
    }

}
