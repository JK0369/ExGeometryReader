//
//  ContentView.swift
//  ExGeometry
//
//  Created by 김종권 on 2022/10/15.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Text("Jake iOS 앱 개발 알아가기")
      
      // container 개념이고, proxy를 통해 내부 뷰들의 레이아웃을 정교하게 구현이 가능
      GeometryReader { proxy in
        Rectangle()
          .foregroundColor(.blue)
          .onAppear {
            print("size = \(proxy.size)")
            print("safeAreaInsets = \(proxy.safeAreaInsets)")
            
            // global, local, named
            print("global = \(proxy.frame(in: .global))")
            print("local = \(proxy.frame(in: .local))")
            print("name = \(proxy.frame(in: .named("OuterVStack")))")
          }
          .overlay(
            Rectangle()
              .foregroundColor(.green)
              .frame(width: proxy.size.width/2, height: proxy.size.height/2)
              .offset(
                x: proxy.frame(in: .local).minX+proxy.size.width/2/2,
                y: proxy.frame(in: .local).minY+proxy.size.height/2/2
              )
          )
      }
    }
    .coordinateSpace(name: "OuterVStack")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

/*
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct GeometryProxy {
    public var size: CGSize { get }
    public subscript<T>(anchor: Anchor<T>) -> T { get }
    public var safeAreaInsets: EdgeInsets { get }
    public func frame(in coordinateSpace: CoordinateSpace) -> CGRect
}
*/


