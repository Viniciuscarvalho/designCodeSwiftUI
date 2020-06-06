//
//  HomeView.swift
//  DesignCodeSwiftUI
//
//  Created by Vinicius Carvalho Marques on 17/03/20.
//  Copyright © 2020 Vinicius Carvalho. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent: Bool
    @Binding var viewState: CGSize
    
    var body: some View {
        GeometryReader { bounds in
            ScrollView {
                VStack {
                    HStack {
                        Text("Watching")
                            .font(.system(size: 28, weight: .bold))
                            .modifier(CustomFontModifier(size: 28))
                        Spacer()
                        
                        AvatarView(showProfile: self.$showProfile)
                        
                        Button(action: { self.showUpdate.toggle() }) {
                            Image(systemName: "bell")
    //                            .renderingMode(.original)
                                .foregroundColor(.primary)
                                .font(.system(size: 16, weight: .medium))
                                .frame(width: 36, height: 36)
                                .background(Color("background3"))
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                        }
                        .sheet(isPresented: self.$showUpdate) {
                            UpdateList()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.leading, 14)
                    .padding(.top, 30)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        WatchRingsView()
                            .padding(.horizontal, 30)
                            .padding(.bottom, 30)
                            .onTapGesture {
                                self.showContent = true
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(sectionData) { item in
                                GeometryReader { geometry in
                                    SectionView(section: item)
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -getAngleMultiplier(bounds: bounds)
                                        ), axis: (x: 0, y: 10, z: 0))
                                }
                                .frame(width: 275, height: 275)
                            }
                        }
                        .padding(30)
                        .padding(.bottom, 30)
                    }
                    .offset(y: -30)
                    
                    HStack {
                        Text("Courses")
                            .font(.title).bold()
                        Spacer()
                    }
                    .padding(.leading, 30)
                    .offset(y: -60)
                    
                    SectionView(section: sectionData[2], width: bounds.size.width - 60, height: 275)
                    .offset(y: -60)
                    
                    Spacer()
                }
                .frame(width: bounds.size.width)
                .offset(y: self.showProfile ? -450 : 0)
                .rotation3DEffect(Angle(degrees: self.showProfile ? Double(self.viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
                .scaleEffect(self.showProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
        }
    }
}

func getAngleMultiplier(bounds: GeometryProxy) -> Double {
    if bounds.size.width > 500 {
        return 80
    } else {
        return 20
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false), viewState: .constant(.zero))
        .environmentObject(UserStore())
    }
}

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30) {
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), width: 44, height: 44, percent: 68, show: .constant(true))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left").bold().modifier(FontModifier(style: .subheadline))
                    Text("Watched 10 mins today").modifier(FontModifier(style: .caption))
                }
                .modifier(FontModifier())
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack {
                RingView(color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), color2: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), width: 32, height: 32, percent: 54, show: .constant(true))
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack {
                RingView(color1: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), width: 32, height: 32, percent: 32, show: .constant(true))
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}

struct SectionView: View {
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [Section(title: "Prototype designs in SwiftUI", text: "18 sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Illustration2")), color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
                   Section(title: "Build a SwiftUI app", text: "20 sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Illustration3")), color: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))),
                   Section(title: "SwiftUI Advanced", text: "18 sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Illustration4")), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
]


