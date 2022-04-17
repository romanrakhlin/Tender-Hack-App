//
//  ContentView.swift
//  Tender App
//
//  Created by Roman Rakhlin on 4/16/22.
//

import SwiftUI
import Charts

struct SessionView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var session: Session
    
    @StateObject var tenderViewModel = TenderViewModel()
    
    @State var offers: [ChartDataEntry] = []
    @State var botIsUp: Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image("back")
                                .resizable()
                                .frame(width: 20, height: 28, alignment: .center)
                        }

                        Text("Котировочная сессия")
                            .font(.system(size: 16, weight: .bold, design: .default))
                        
                        Text("№ \(session.sessionId)")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(Color.black)
                            .opacity(0.5)
                        
                        Spacer()
                        
                        Button {
                            print("")
                        } label: {
                            Image(systemName: "")
                                .resizable()
                                .frame(width: 24, height: 24, alignment: .center)
                        }
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // chart
                        OffersChart(entries: $offers)
                    
                        // price
                        VStack(alignment: .leading) {
                            Text("Предполагаемая цена")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                            Text("3 800 ₽")
                                .font(.system(size: 32, weight: .bold, design: .default))
                                .foregroundColor(Color.red)
                        }
                        
                        // strategy
                        VStack(alignment: .leading) {
                            Text("Текущая стратегия")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ZStack {
                                        Text("Агрессивная")
                                            .font(.system(size: 16, weight: .semibold, design: .default))
                                            .foregroundColor(Color.white)
                                            .padding()
                                    }
                                    .background(Color.red)
                                    .cornerRadius(12)
                                    
                                    ZStack {
                                        Text("Умеренная")
                                            .font(.system(size: 16, weight: .semibold, design: .default))
                                            .foregroundColor(Color.black)
                                            .padding()
                                    }
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    
                                    ZStack {
                                        Text("Выматывающая")
                                            .font(.system(size: 16, weight: .semibold, design: .default))
                                            .foregroundColor(Color.black)
                                            .padding()
                                    }
                                    .background(Color.white)
                                    .cornerRadius(12)
                                }
                            }
                            
                            Text("Стратегия выбрана автоматически, последнее изменение в 14:30")
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .lineLimit(2)
                                .foregroundColor(Color.black)
                                .opacity(0.5)
                        }
                        
                        // Minimum Price
                        VStack(alignment: .leading) {
                            Text("Минимальная ставка")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                            Text("3 000 ₽")
                                .font(.system(size: 32, weight: .bold, design: .default))
                                .foregroundColor(Color.red)
                        }
                        
                        // Quit Requirements
                        VStack(alignment: .leading) {
                            Text("Условие выхода")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                            Text("3 150 ₽")
                                .font(.system(size: 32, weight: .bold, design: .default))
                                .foregroundColor(Color.red)
                            Text("5% от минимума")
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .foregroundColor(Color.red)
                                .opacity(0.5)
                        }
                        
                        // Log
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Лог Действий")
                                .font(.system(size: 14, weight: .semibold, design: .default))
                                .textCase(.uppercase)
                                .foregroundColor(Color.black)
                            
                            // TODO: - add for each loop here
                            VStack(alignment: .leading) {
                                Text("1 минуту назад")
                                    .font(.system(size: 14, weight: .semibold, design: .default))
                                    .foregroundColor(Color.black)
                                    .opacity(0.5)
                                
                                HStack {
                                    Text("Сделана новая ставка:")
                                        .font(.system(size: 16, weight: .semibold, design: .default))
                                        .foregroundColor(Color.black)
                                        .opacity(0.5)

                                    Text("4 100 ₽")
                                        .font(.system(size: 16, weight: .semibold, design: .default))
                                        .foregroundColor(Color.red)
                                        .opacity(0.5)
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text("5 минуту назад")
                                    .font(.system(size: 14, weight: .semibold, design: .default))
                                    .foregroundColor(Color.black)
                                    .opacity(0.5)
                                
                                HStack {
                                    Text("Сделана новая ставка:")
                                        .font(.system(size: 16, weight: .semibold, design: .default))
                                        .foregroundColor(Color.black)
                                        .opacity(0.5)

                                    Text("4 100 ₽")
                                        .font(.system(size: 16, weight: .semibold, design: .default))
                                        .foregroundColor(Color.red)
                                        .opacity(0.5)
                                }
                            }
                        }
                    }
                }
                
                Spacer(minLength: 80)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            
            VStack {
                Spacer()
                
                VStack(spacing: 10) {
                    Button {
                        tenderViewModel.createOffer(for: "romanrakhlin", andId: session.sessionId)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                            hotRealodChart()
                        }
                    } label: {
                        HStack {
                            Spacer()
                            
                            Text("Сделать ставку")
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .foregroundColor(Color.white)
                                .padding()
                            
                            Spacer()
                        }
                        .background(Color.red)
                        .cornerRadius(16)
                    }
                    
                    Button {
                        if botIsUp {
                            botIsUp = false
                            tenderViewModel.stopBot(for: "Hack", andId: session.sessionId)
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                                hotRealodChart()
                            }
                        } else {
                            botIsUp = true
                            tenderViewModel.startBot(for: "Hack", andId: session.sessionId)
                        }
                    } label: {
                        HStack {
                            Spacer()
                            
                            Text(botIsUp ? "Остановить автоматический режим" : "Начать автоматический режим")
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .foregroundColor(Color.white)
                                .padding()
                            
                            Spacer()
                        }
                        .background(Color.green)
                        .cornerRadius(16)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            hotRealodChart()
        }
    }
    
    private func hotRealodChart() {
        tenderViewModel.fetchOffers(currentId: session.sessionId) { offers in
            guard let goodOffers = offers else { return }
            
            self.offers = []
            
            var yCounter = 0

            for offer in goodOffers.result {
                self.offers.append(ChartDataEntry(x: Double(offer.timestamp), y: Double(offer.price)))

                yCounter += 1
            }
        }
    }
}
