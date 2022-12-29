//
//  TestSearch.swift
//  test
//
//  Created by Hadeel Alturaier on 06/04/1444 AH.
//

import SwiftUI

struct TestSearch: View {
    @State private var searchText = ""
    var body: some View {
        VStack(){
            Text("hi")
                .searchable(text: $searchText)
        }
    }.background(.black)
}

struct TestSearch_Previews: PreviewProvider {
    static var previews: some View {
        TestSearch()
    }
}
