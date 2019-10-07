//
//  ContentView.swift
//  BloodDonate
//
//  Created by Alok Upadhyay on 10/4/19.
//  Copyright © 2019 iOSDose.Alok. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
  var body: some View {
    VStack{
      ContentViewHeader().background(Color.white)
      ContentViewLatestNews().padding(.top, 20)
      ContentViewCollection(axis: .horizontal)
        .animation(.easeIn, value: 5)
        .padding()
      ContentViewCollection(axis: .vertical)
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


struct ContentViewCollection: View {
  
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
  
  var body: some View {
    
    ScrollView(axis, showsIndicators: true){
      
      if (axis == .horizontal){
        HStack{
          ForEach(boxes) { box in
            BoxView(box: box)
              .frame(width: 170, height: 180, alignment: .bottom)
              .background(Image("0").resizable())
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
          }
          
        }
      }else{
        VStack{
          ForEach(boxes) { box in
            BoxViewTable(box: box)
              .background(Color.white)
              .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
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
    ZStack (alignment: .bottom){
      LinearGradient(
        gradient: Gradient(colors: [.black, .gray]),
        startPoint: .top,
        endPoint: .bottom
      )
        .luminanceToAlpha()
      LinearGradient(
        gradient: Gradient(colors: [.black, .gray]),
        startPoint: .top,
        endPoint: .bottom
      )
        .luminanceToAlpha()
      VStack(alignment:.leading){
        Text("\(box.newsTitle)")
          .foregroundColor(.white)
          .lineLimit(3)
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .frame(alignment:.leading)
          .padding([.bottom, .leading, .trailing], 5)
        
        Text("\(box.newsSubTitle) - \(box.dateTime)")
          .lineLimit(3)
          .foregroundColor(.gray)
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .frame(alignment:.leading)
          .padding([.bottom, .leading, .trailing], 5)
        
      }
    }.overlay(
      RoundedRectangle(cornerRadius: 3)
        .stroke(Color.white, lineWidth: 3)
    ).clipped()
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
          .foregroundColor(.black)
          .font(.system(size: 14, weight: .medium, design: .rounded))
        Text("\(box.newsSubTitle) - \(box.dateTime)")
          .foregroundColor(.gray)
          .font(.system(size: 13, weight: .regular, design: .rounded))
      }
      
    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
      .overlay(
        RoundedRectangle(cornerRadius: 3)
          .stroke(Color.white, lineWidth: 3)
    ).clipped()
    
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
      Text("LIVE TO DONATE").font(.system(size: 21, weight: .bold, design: .default))
    }
    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
  }
}

//Register
struct ContentViewRegister: View {
  @State var showingDetail = false
  var body: some View {
    
    VStack {
      Button (action: {
        print("btn clicked")
        //https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets
        self.showingDetail.toggle()
      }) {
        Text("REGISTER")
          .font(.system(size: 13, weight: .bold, design: .rounded))
          .foregroundColor(.white)
          
          .padding()
      }.sheet(isPresented: $showingDetail) {
        //https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets
        MyView()
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


//*https://dev.to/kevinmaarek/working-with-your-uiviewcontroller-and-swiftui-2917
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets
struct MyView : View {
  var body: some View {
    ViewControllerWrapper()
  }
}


struct ViewControllerWrapper: UIViewControllerRepresentable {
  
  typealias UIViewControllerType = RegisterNowViewController
  
  func updateUIViewController(_ uiViewController: RegisterNowViewController, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
    
  }
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ViewControllerWrapper.UIViewControllerType {
    
    
    return UIStoryboard(name: "Register", bundle: nil).instantiateViewController(identifier: String(describing: RegisterNowViewController.self)) as! RegisterNowViewController
    
  }
  
}
