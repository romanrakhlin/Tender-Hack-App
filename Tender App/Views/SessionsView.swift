//
//  SessionsView.swift
//  Tender App
//
//  Created by Roman Rakhlin on 4/16/22.
//

import SwiftUI

struct SessionsView: View {
    
    @StateObject var tenderViewModel = TenderViewModel()
    
    @State var sessions: Sessions = []
    @State var choosenSession: Session = Session(sessionId: 999, step: 99.9, startPrice: 999, startTime: 99.9, length: 999, authorUsername: "999")
    @State var notLoaded: Bool = true
    @State var showDetail: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading) {
                Text("Ваши сессии")
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .padding()
            }
            
            ScrollView(showsIndicators: false) {
                if notLoaded == false {
                    ForEach(sessions, id: \.self) { session in
                        Button {
                            choosenSession = session
                            showDetail.toggle()
                        } label: {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading) {
                                        Text("N \(session.sessionId) от \(session.startTime)")
                                            .font(.system(size: 16, weight: .regular, design: .default))
                                            .foregroundColor(Color.black.opacity(0.4))
                                        
                                        Text(session.authorUsername)
                                            .font(.system(size: 22, weight: .bold, design: .default))
                                            .foregroundColor(Color.black)
                                            .lineLimit(2)
                                    }
                                    
                                    Spacer()
                                    
                                    Image("board")
                                        .resizable()
                                        .frame(width: 45, height: 45, alignment: .center)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("Ваше предложение лучшее среди конкурентов")
                                        .font(.system(size: 16, weight: .semibold, design: .default))
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(1)
                                        .foregroundColor(Color.black)
                                    
                                    Text("Ваше предложение лучшее среди конкурентов")
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(1)
                                        .foregroundColor(Color.black.opacity(0.4))
                                }
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.red.opacity(0.4), lineWidth: 4)
                            )
                            .padding()
                        }
                    }
                } else {
                    Text("no resuslts :(")
                }
            }
        }
        .onAppear {
            tenderViewModel.fetchSessions() { sessions in
                if let goodSessions = sessions {
                    let reversedSessions = goodSessions
                    
                    // check active or not
                    for index in 0..<reversedSessions.count {
                        let currentSession = reversedSessions[index]
                        let timePassed = Int(currentSession.startTime) + Int(currentSession.length)
                        let rightNow = UInt64(Date().timeIntervalSince1970 * 1000)
                        
                        if timePassed < rightNow {
                            
                        } else {
                            
                        }
                    }
                    
                    // reversing all sessions
                    
                    self.notLoaded = false
                } else {
                    self.notLoaded = true
                }
            }
        }
        .fullScreenCover(isPresented: $showDetail) {
            SessionView(session: $choosenSession)
        }
    }
}
