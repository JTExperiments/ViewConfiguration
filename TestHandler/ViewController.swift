//
//  ViewController.swift
//  TestHandler
//
//  Created by James Tang on 14/10/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

import UIKit

class Author : NSObject {
    var name : String?
    var url : String?

    init(name: String?) {
        self.name = name
    }
}

class Quote : NSObject {
    var string : String?
    var author : Author?

    init(string: String?) {
        self.string = string
    }
    init(string: String?, author: Author) {
        self.string = string
        self.author = author
    }
}

class ViewController: UITableViewController {

    var allQuotes : [Quote]?

    override func viewDidLoad() {
        super.viewDidLoad()

        let james = Author(name: "James")
        james.url = "https://pbs.twimg.com/profile_images/378800000599124073/db1c3a4f06b15eacb7ce978ea2760e21_bigger.jpeg"

        allQuotes = [
            Quote(string: "Last time at SLUG, we were excited to welcome NatashaTheRobot at our latest meetup, graciously hosted by Eventbrite.", author: james),
            Quote(string: "TableViews are the foundation of many iOS applications, and Swift provides several unexplored patterns for approaching TableViews. In this talk, Natasha goes over the basics of TableViews and how to apply “Swift-thinking” when approaching them in iOS8. Natasha is an iOS engineer who’s currently blogging about her experience learning Swift, and has started sending out a weekly Swift newsletter!"),
            Quote(string: "As usual, video & slides are synchronized."),
            Quote(string: "The video is also subtitled. You can find a blog version of the talk (with code samples) below, as well as source code here."),
        ]

        println(allQuotes)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let quote = self.allQuotes?[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell

        cell?.configureWithObject(quote)

        return cell!
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allQuotes?.count ?? 0
    }
}

