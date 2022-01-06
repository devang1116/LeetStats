//
//  LoginScreen.swift
//  LeetCode
//
//  Created by Devang Papinwar on 05/01/22.
//

import SwiftUI

struct LoginScreen: View
{
    @State var showStats = false
    @State var leetCodeData : LeetCodeModel?
    @State var username = "Devang41"
    
    var body: some View
    {
        VStack
        {
            Spacer()
            Image("leet")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 150)
            Spacer()

            GroupBox
            {
                
            } label:
            {
                Text("Enter your Leetcode UserName : ")
                    .font(.headline)
                
                
                TextField("", text: $username)
                    .padding()
                    .frame(height:60)
                    .cornerRadius(12)
                    .autocapitalization(.none)
                    .accentColor(Color.white)
                    .background(Color.init(red: 34, green: 160, blue: 236))
            }

            Button
            {
                self.fetchData()
            } label: {
                Text("Get Statistics")
            }
            .font(.title3)
            .padding()
            .frame(height:60)
            .background(Color.accentColor)
            .cornerRadius(20)
            .foregroundColor(Color.white)

            Spacer()
            Spacer()
            Spacer()
        }
        .fullScreenCover(isPresented: $showStats)
        {
            if let model = leetCodeData {
                UserScreen(model: model, username: "Devang41")
            }
            else
            {
                UserScreen(model: LeetCodeModel(username: nil, streak: 1, ranking: 66790, totalMedium: 1136, totalQuestions: 2128, acceptanceRate: 67.29, easySolved: 169, totalSolved: 378, hardSolved: 24, submissionCalendar: ["1624838400": 2, "1622937600": 6, "1627084800": 8, "1628380800": 8, "1635638400": 3, "1638921600": 2, "1623628800": 6, "1622764800": 12, "1628208000": 1, "1627862400": 4, "1630108800": 3, "1633996800": 2, "1631491200": 8, "1624406400": 16, "1629936000": 15, "1634083200": 9, "1626652800": 5, "1632614400": 1, "1634601600": 3, "1623888000": 2, "1633651200": 5, "1630281600": 2, "1625961600": 5, "1628294400": 18, "1635292800": 6, "1632528000": 25, "1625529600": 9, "1632268800": 18, "1633392000": 1, "1625702400": 6, "1624665600": 12, "1626307200": 12, "1623974400": 30, "1632009600": 3, "1631750400": 3, "1627776000": 11, "1628467200": 9, "1631404800": 13, "1623715200": 7, "1627257600": 5, "1625443200": 17, "1629331200": 1, "1636416000": 5, "1632700800": 6, "1626739200": 6, "1627689600": 13, "1638057600": 3, "1628985600": 9, "1635120000": 12, "1629417600": 1, "1630972800": 7, "1634169600": 1, "1629244800": 5, "1633737600": 6, "1634774400": 7, "1632182400": 14, "1631577600": 6, "1628035200": 2, "1629072000": 7, "1634947200": 2, "1622678400": 4, "1631836800": 6, "1623196800": 1, "1626912000": 7, "1627430400": 11, "1630886400": 3, "1626998400": 7, "1630540800": 9, "1637625600": 2, "1627516800": 13, "1636329600": 3, "1628640000": 1, "1629158400": 1, "1629849600": 11, "1627603200": 4, "1630627200": 4, "1633910400": 8, "1631059200": 2, "1624233600": 7, "1626825600": 4, "1632960000": 5, "1624147200": 16, "1631664000": 15, "1626048000": 8, "1625788800": 7, "1618704000": 2, "1631923200": 6, "1623801600": 5, "1626134400": 17, "1632873600": 11, "1626566400": 1, "1624492800": 6, "1624924800": 1, "1627171200": 20, "1628899200": 7, "1632441600": 6, "1624060800": 14, "1635897600": 2, "1628812800": 25, "1631145600": 2, "1636934400": 4, "1630368000": 4, "1637020800": 2, "1634860800": 3, "1632096000": 12, "1635206400": 3, "1625616000": 21, "1634688000": 9, "1632355200": 10, "1641340800": 8, "1633824000": 3, "1628553600": 5, "1624320000": 20, "1622851200": 9, "1623024000": 6, "1636675200": 2, "1633046400": 11, "1627344000": 12, "1634515200": 2, "1632787200": 14, "1623110400": 5, "1622592000": 14, "1633305600": 7, "1625356800": 1, "1635033600": 2, "1637712000": 7, "1630800000": 7, "1624579200": 24, "1628121600": 4, "1628726400": 13, "1625875200": 24, "1624752000": 6, "1626220800": 26, "1633132800": 10, "1635465600": 5, "1633219200": 2, "1635724800": 1, "1630022400": 8, "1629763200": 8], mediumSolved: 185, contributionPoints: 871, totalEasy: 538, message: "retrieved", status: "success", totalHard: 454, reputation: 0), username: "Devang41")
            }
        }

    }
    
    func fetchData()
    {
        let urlString = "https://leetcode-stats-api.herokuapp.com/\(username)"
        
        if let url = URL(string: urlString)
        {
            if let data = try? Data(contentsOf: url)
            {
                parseJSON(json: data)
            }
        }
    }
    
    func parseJSON(json : Data)
    {
        let decoder = JSONDecoder()
        if let model = try? decoder.decode(LeetCodeModel.self, from: json)
        {
            self.leetCodeData = model
            print(model)
            self.showStats.toggle()
        }
        else
        {
            print("Invalid Username")
        }
    }
}

struct LoginScreen_Previews: PreviewProvider
{
    static var previews: some View
    {
        LoginScreen()
    }
}
