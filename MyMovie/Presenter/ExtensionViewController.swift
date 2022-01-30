
import UIKit
import Alamofire

extension ViewController: UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UITextFieldDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
            cell.lableTitleCell.text = movie[indexPath.row].Title
            
            if let data = try? Data(contentsOf: URL(string: movie[indexPath.row].Poster)!){
                cell.imageViewCell.image = UIImage(data: data)
                
            
                cell.selectionStyle = .none
                
                cell.checkLoveBtn.tag = indexPath.row
                
                cell.checkLoveBtn.addTarget(self, action: #selector(didSelecetedContent(sender:)), for: .touchUpInside)
                
               
            }
            
            return cell
            
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if saveContent.isEmpty {
            return 0
        }else{
            return saveContent.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        
        cell.collectionMyLabel.text = saveContent[indexPath.row].Title
        if let data = try? Data(contentsOf: URL(string: saveContent[indexPath.row].Poster)!){
            cell.collectionMyImage.image = UIImage(data: data)
        }
        return cell
    }
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovie()
        return true
    }
    
    
    func searchMovie(){
        searchTextField.resignFirstResponder()
        
        guard let userInput = searchTextField.text, !userInput.isEmpty else {
            return
        }
        let query = userInput.replacingOccurrences(of: " ", with: "%20")
        movie.removeAll()
        let URL: String = "https://www.omdbapi.com/?apikey=3aea79ac&s=\(query)and&type=movie"
        AF.request(URL,method: .get).responseDecodable(of: MovieResult.self){[weak self] response in
            print("disini response \(response.value?.Search.first?.Title ?? "hmmm")")
            if response.value?.Search == nil{
                self!.movie.append(Movie(Title: "Empty Movie", Year: "0", imdbID: "0", Poster: "https://webcolours.ca/wp-content/uploads/2020/10/webcolours-unknown.png"))
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }else{
                self!.movie.append(contentsOf: response.value!.Search)
                            DispatchQueue.main.async {
                                self?.tableView.reloadData()
                            }
            }
            
            
        }
        
        
    }
    
    @objc func didSelecetedContent( sender: UIButton) {
        let setFav: RealmMovie = RealmMovie()
        let selectedMovie = movie[sender.tag]
       
        
        setFav.Title.append(selectedMovie.Title)
        setFav.Poster.append(selectedMovie.Poster)
        let localMovie = MovieLocalRepository()
        
      
        localMovie.setLocalMovie(item: setFav)
       if sender.isSelected{
        sender.isSelected = false
       }else{
        sender.isSelected = true
        sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
       }
        
    }
    
    
}


