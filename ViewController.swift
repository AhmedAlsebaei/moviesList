//
//  ViewController.swift
//  movie list.x
//
//  Created by ahmed aelsebaay on 24/04/2021.
//

import UIKit
import Alamofire
import Kingfisher
import PMSuperButton
class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource  {
  
    
    var movies = [Movie]()
    
    
    
    @IBOutlet weak var movieslisttable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieslisttable.delegate=self
        self.movieslisttable.dataSource=self
       
        self.loadmovieslist()
        //self.movies.append(Movie(title: "titanic", releasyear: "2020", type: "action", movielink: "blah"))
        
    //   self.movieslisttable.reloadData()
        
      
    }
    func loadmovieslist(){
        let APIUrl = "http://www.omdbapi.com/"
        let params :[String:Any]=["apikey":"b52fc4a5" , "s":"Titanic"]
        Alamofire.request(APIUrl, method:.get , parameters: params  , encoding: URLEncoding.default, headers: nil).responseJSON { (myresponse) in
            do{
                
                
                let jsonmovies = try JSONDecoder() .decode(Searchresults.self, from: myresponse.data!)
                
                self.movies = jsonmovies.Search
                self.movieslisttable.reloadData()
                
            }catch let err {
                print("there is errore and it is :\(err)")
            }
            
        }
        
    }



    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie = self.movies[indexPath.row]
        let view = self.storyboard?.instantiateViewController(withIdentifier: "moviedetailsViewController")as! moviedetailsViewController
        view.movie=movie
        self.navigationController?.pushViewController( view, animated: true)
    }




    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = self.movies[indexPath.row]
        
        let cell =
            self .movieslisttable.dequeueReusableCell(withIdentifier: "moviecell")as! moviecell
        cell.movietitle.text = movie.Title
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
}
}


