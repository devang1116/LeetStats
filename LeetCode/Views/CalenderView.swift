////
////  CalenderView.swift
////  LeetCode
////
////  Created by Devang Papinwar on 05/01/22.
////
//
//import SwiftUI
//
//struct CalenderView: View {
//    
//    @State var colorData = ColorData()
//
//    var body: some View {
//        CalendarHeatmapWrapper(colorData: $colorData).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//    }
//
//    private func readHeatmap() -> [String: Int]? {
//        guard let url = Bundle.main.url(forResource: "heatmap", withExtension: "plist") else { return nil }
//        return NSDictionary(contentsOf: url) as? [String: Int]
//    }
//}
//
//struct Calender_Previews: PreviewProvider {
//    static var previews: some View {
//        CalenderView()
//    }
//}
//
