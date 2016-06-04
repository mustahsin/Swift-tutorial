//  First you need to create your audio url

    if let audioUrl = NSURL(string: "http://freetone.org/ring/stan/iPhone_5-Alarm.mp3") {

        // then lets create your document folder url
        let documentsDirectoryURL =  NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!

        // lets create your destination file url
        let destinationUrl = documentsDirectoryURL.URLByAppendingPathComponent(audioUrl.lastPathComponent ?? "audio.mp3")
        print(destinationUrl)

        // to check if it exists before downloading it
        if NSFileManager().fileExistsAtPath(destinationUrl.path!) {
            print("The file already exists at path")

            // if the file doesn't exist
        } else {

            // you can use NSURLSession.sharedSession to download the data asynchronously
            NSURLSession.sharedSession().downloadTaskWithURL(audioUrl, completionHandler: { (location, response, error) -> Void in
                guard let location = location where error == nil else { return }
                do {
                    // after downloading your file you need to move it to your destination url
                    try NSFileManager().moveItemAtURL(location, toURL: destinationUrl)
                    print("File moved to documents folder")
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }).resume()
        }
    }
