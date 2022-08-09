//
//  ViewController.swift
//  TableView Practice
//
//  Created by 백경호 on 2022/08/05.
//

import UIKit

class ViewController: UIViewController {
    
    var moviesArray: [Movie] = []
    
    var movieDataManager = DataManager()

    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.dataSource = self
        tableView.rowHeight = 120
        
        tableView.delegate = self
        
        title = "영화목록"
        
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
    }

    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        movieDataManager.updateMovieData()
        moviesArray = movieDataManager.getMovieData()
        tableView.reloadData()
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = moviesArray[indexPath.row]
        
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text  = movie.movieName
        cell.descriptionLable.text = movie.movieDescription
        cell.selectionStyle = .none
        
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetail", sender: indexPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let array = movieDataManager.getMovieData()
            let indexPath = sender as! IndexPath
            detailVC.movieData = array[indexPath.row ]
        }
    }
    
    
}

