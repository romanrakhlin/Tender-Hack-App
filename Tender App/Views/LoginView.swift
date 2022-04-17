//
//  LoginView.swift
//  Tender App
//
//  Created by Roman Rakhlin on 4/16/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var showSessionsView: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 40) {
                ZStack {
                    Color.red
                    
                    VStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 40) {
                            HStack {
                                Image("logo")
                                    .resizable()
                                    .frame(width: 35, height: 35, alignment: .center)
                                    
                                Text("Портал Поставщиков")
                                    .font(.system(size: 18, weight: .bold, design: .default))
                                    .textCase(.uppercase)
                            }
                            .padding(.top, 40)

                            VStack(alignment: .leading, spacing: 20) {
                                Text("Автоматические котировочные сессии")
                                    .font(.system(size: 64, weight: .bold, design: .default))
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(2)
                                Text("Успешный контракт в два клика")
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                    .lineLimit(1)
                            }
                        }
                        .foregroundColor(Color.white)
                        .padding()
                        
                        WaveShape()
                            .foregroundColor(Color.red)
                    }
                }
                
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        ZStack {
                            HStack {
                                Spacer()
                                
                                Image("one")
                                    .resizable()
                                    .scaledToFit()
                            }
                            
                            VStack(spacing: 20) {
                                Spacer()
                                
                                Text("Зарегистрируйтесь на портале")
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(2)
                            }
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                        }
                        .frame(height: 90)
                        .background(Color.red.opacity(0.3))
                        .cornerRadius(16)
                        
                        ZStack {
                            HStack {
                                Spacer()
                                
                                Image("two")
                                    .resizable()
                                    .scaledToFit()
                            }
                            
                            VStack(spacing: 20) {
                                Spacer()
                                
                                Text("Создайте оферту")
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(2)
                            }
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                        }
                        .frame(height: 90)
                        .background(Color.red.opacity(0.3))
                        .cornerRadius(16)
                    }
                    
                    HStack(spacing: 20) {
                        ZStack {
                            HStack {
                                Spacer()
                                
                                Image("three")
                                    .resizable()
                                    .scaledToFit()
                            }
                            
                            VStack(spacing: 20) {
                                Spacer()
                                
                                Text("Выставите цену")
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(2)
                            }
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                        }
                        .frame(height: 90)
                        .background(Color.red.opacity(0.3))
                        .cornerRadius(16)
                        
                        ZStack {
                            HStack {
                                Spacer()
                                
                                Image("four")
                                    .resizable()
                                    .scaledToFit()
                            }
                            
                            VStack(spacing: 20) {
                                Spacer()
                                
                                Text("Ожидайте конца сессии")
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(2)
                            }
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                        }
                        .frame(height: 90)
                        .background(Color.red.opacity(0.3))
                        .cornerRadius(16)
                    }
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("1,3 тыс.")
                                .font(.system(size: 32, weight: .bold, design: .default))
                            
                            Text("контрактов заключено сегодня")
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .opacity(0.5)
                                .minimumScaleFactor(0.5)
                                .lineLimit(2)
                        }
                        .frame(width: 180)
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("1,6 млн.")
                                .font(.system(size: 32, weight: .bold, design: .default))
                            
                            Text("участников сессий")
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .opacity(0.5)
                                .minimumScaleFactor(0.5)
                                .lineLimit(2)
                        }
                        .frame(width: 180)
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("260,7 тыс.")
                                .font(.system(size: 32, weight: .bold, design: .default))
                            
                            Text("поставщиков")
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .opacity(0.5)
                                .minimumScaleFactor(0.5)
                                .lineLimit(2)
                        }
                        .frame(width: 180)
                        .padding()
                    }
                }
                
                VStack {
                    Button {
                        showSessionsView.toggle()
                    } label: {
                        HStack {
                            Spacer()
                            
                            Text("Войти в аккаунт")
                                .font(.system(size: 16, weight: .medium, design: .default))
                                .foregroundColor(Color.black)
                                .padding()
                            
                            Spacer()
                        }
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(16)
                    }
                    
                    Button {
                        print("no functionality for that :(")
                    } label: {
                        HStack {
                            Spacer()
                            
                            Text("Стать поставщиком")
                                .font(.system(size: 16, weight: .medium, design: .default))
                                .foregroundColor(Color.white)
                                .padding()
                            
                            Spacer()
                        }
                        .background(Color.red)
                        .cornerRadius(16)
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 40)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showSessionsView) {
            SessionsView()
        }
    }
}
