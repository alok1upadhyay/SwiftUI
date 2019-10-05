//
//  ContentView.swift
//  BloodDonate
//
//  Created by Haider Khan on 10/4/19.
//  Copyright © 2019 iOSDose.Alok. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      VStack{
        ContentViewHeader()
        ContentViewLatestNews().background(Color.gray)
        ContentViewHCollection(axis: .horizontal)
          .padding()
        ContentViewHCollection(axis: .vertical)
      }.background(Image("NewsGradientBg").resizable())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentViewHeader: View {
    var body: some View {
      VStack {
          HStack {

              ContentViewLive()
              .padding()
             ContentViewRegister()
            .padding()
          }
      }
  }
}


struct ContentViewHCollection: View {
  
  var axis : Axis.Set = .horizontal
  
  
  let boxes : [Box] =
    [
      Box(newsTitle: "Using statistics to prevent teh loss of blood donors", newsSubTitle: "Dariya News", dateTime: "14 hours ago", imgUrl : "0", id: 0),
                           
      Box(newsTitle: "Competent foundation organised 22nd Blood Dobation camp", newsSubTitle: "Dariya News", dateTime: "14 hours ago", imgUrl : "0", id: 1),
                           
      Box(newsTitle: "Competent foundation organised 22nd Blood Dobation camp", newsSubTitle: "Dariya News", dateTime: "14 hours ago", imgUrl : "0", id: 2),
      
      Box(newsTitle: "Competent foundation organised 22nd Blood Dobation camp", newsSubTitle: "Dariya News", dateTime: "14 hours ago", imgUrl : "0", id: 3),
      
      Box(newsTitle: "Using statistics to prevent teh loss of blood donors", newsSubTitle: "Dariya News", dateTime: "14 hours ago", imgUrl : "0", id: 0),
                           
      Box(newsTitle: "Competent foundation organised 22nd Blood Dobation camp", newsSubTitle: "Dariya News", dateTime: "14 hours ago", imgUrl : "0", id: 1),
                           
      Box(newsTitle: "Competent foundation organised 22nd Blood Dobation camp", newsSubTitle: "Dariya News", dateTime: "14 hours ago", imgUrl : "0", id: 2),
      
      Box(newsTitle: "Competent foundation organised 22nd Blood Dobation camp", newsSubTitle: "Dariya News", dateTime: "14 hours ago", imgUrl : "0", id: 3)
  ]
  //https://medium.com/@max.codes/swiftui-collection-view-with-lists-1fa9f97a1f8
    var body: some View {
        
      ScrollView(axis, showsIndicators: true){
        
        if (axis == .horizontal){
          HStack{
             ForEach(boxes) { box in
              BoxView(box: box)
              .frame(width: 150, height: 180, alignment: .bottom)
             }.background(Image("0").resizable()
            )
          }
        }else{
          VStack{
             ForEach(boxes) { box in
              BoxViewTable(box: box)
                .background(Color.white)
             }
          }
        }
      }
    }
}


struct Box : Identifiable {
  
  var newsTitle : String = "News Title"
  var newsSubTitle : String = "News Subtitle"
  var dateTime : String = "News Date Time"
  var imgUrl : String = "0"
  var id : Int = 0
}

struct BoxView: View{
  
  let box : Box
  
  var body: some View {
    VStack{
      Text("\(box.newsTitle)")
        .lineLimit(3)
        .multilineTextAlignment(.leading)
      .frame(alignment:.leading)

      Text("\(box.newsSubTitle) - \(box.dateTime)")
        .multilineTextAlignment(.leading)
        .frame(alignment:.leading)
    }
  }
  
}

struct BoxViewTable: View{
  
  let box : Box
  
  var body: some View {
    HStack{
      
      Image("\(box.imgUrl)")
        .resizable()
        .frame(width: 80, height: 100, alignment: .leading)
      
      VStack(alignment:.leading){
        Text("\(box.newsTitle)")
          .lineLimit(2)
        Text("\(box.newsSubTitle) - \(box.dateTime)")
      }
      
    }

  }
  
}

struct ContentViewTable: View {
    var body: some View {
        Text("Hello World")
    }
}


//LIve view
struct ContentViewLive: View {
    var body: some View {
      VStack {
        Text("LIVE TO DONATE").font(.headline)
      }
      .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
}

//Register
struct ContentViewRegister: View {
    var body: some View {
      
      VStack {
                       Button (action: {
                                 print("btn clicked")
                               }) {
                                 Text("REGISTER")
                                   .font(.system(size: 13, weight: .bold, design: .rounded))
                                   .foregroundColor(.white)
                                   
                                 .padding()
                       }
                       .background(Color.red)
                     .overlay(
                         RoundedRectangle(cornerRadius: 5)
                             .stroke(Color.red, lineWidth: 2)
                     )
                     
                   
                     
                   }
                       .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
    }
}

//Latest News Title
struct ContentViewLatestNews: View {
    var body: some View {
     Text("Latest News")
      .fontWeight(.bold)
      .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
    }
  
}


