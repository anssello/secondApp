import UIKit

class TableViewController1: UITableViewController {
    
    class Anime {
        var title: String
        var imageFileName = "defaultImage"
        var info = "There is no information"
        
        init(title: String, imageFileName: String, info: String) {
            self.title = title
            self.imageFileName = imageFileName
            self.info = info
        }
        
        
        init(title:String){
            self.title = title
        }
        
    }
    
   
    var arrayOfAnime = [Anime(title: "One Piece", imageFileName: "OP", info: "One Piece (stylized in all caps) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's shōnen manga magazine Weekly Shōnen Jump since July 1997, with its individual chapters compiled in 107 tankōbon volumes as of November 2023. The story follows the adventures of Monkey D. Luffy and his crew, the Straw Hat Pirates, where he explores the Grand Line in search of the mythical treasure known as the \"One Piece\" in order to become the next King of the Pirates."),
                        Anime(title: "Demon Slayer", imageFileName: "DS", info: "Demon Slayer: Kimetsu no Yaiba (鬼き滅めつの刃やいば Kimetsu no Yaiba?, lit. \"Blade of Demon Destruction\") is a manga series written and illustrated by Koyoharu Gotoge. It has been serialized in Weekly Shonen Jump since February 15, 2016. The series is republished in English by Viz Media.The series officially ended on May 18, 2020 (Weekly Shonen Jump Issue #24) with a total of 205 chapters."),
                        Anime(title: "Hunter x Hunter", imageFileName: "HH", info: " \"Hunter Hunter\", is a Japanese manga series written and illustrated by Yoshihiro Togashi with two anime adaptations. The first chapter of the Hunter × Hunter manga series was published in March 1998, in Weekly Shōnen Jump.The story of Hunter × Hunter focuses on a young boy named Gon Freecss, who one day discovers that the father he has always been told was dead is alive and well. He learns that his father, Ging Freecss, is a legendary Hunter. Despite the fact that his father abandoned Gon with his relatives in order to pursue his dreams, Gon becomes determined to follow his father's footsteps, pass the Hunter Exam, and eventually find his father to prove himself as a Hunter in his own right.")]
    
    @IBAction func addAnime(_ sender: Any) {
        arrayOfAnime.append(Anime(title: "New Anime Title"))
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfAnime.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let titleLabel = cell.viewWithTag(1000) as! UILabel
        titleLabel.text = arrayOfAnime[indexPath.row].title
        let imageView = cell.viewWithTag(1001) as! UIImageView
        imageView.image = UIImage(named: arrayOfAnime[indexPath.row].imageFileName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewCt = storyboard?.instantiateViewController(withIdentifier: "infoViewController") as! ViewController
        
        viewCt.titleOfAnime = arrayOfAnime[indexPath.row].title
        
        viewCt.imageName = arrayOfAnime[indexPath.row].imageFileName
        navigationController?.show(viewCt, sender: self)
        viewCt.info = arrayOfAnime[indexPath.row].info
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            arrayOfAnime.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

        }
    }
    
}
