# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

        Book.destroy_all        
        Store.destroy_all
        

        store_1 = Store.create!(city: "Aurora", open: true, income_rank: 2)
        store_2 = Store.create!(city: "Denver", open: true, income_rank: 1)
        store_3 = Store.create!(city: "Castle Rock", open: false, income_rank: 5)
        store_4 = Store.create!(city: "Colorado Springs", open: true, income_rank: 3)
        store_5 = Store.create!(city: "Crested Butte", open: false, income_rank: 4)

        book_1 = store_1.books.create!(name: "In the Beginning", series: "Dark Knights of Steel", volume: 1, on_display: false)
        book_2 = store_1.books.create!(name: "Distant Thunder", series: "Dark Knights of Steel", volume: 2, on_display: false)
        book_3 = store_1.books.create!(name: "The Long Way Home: Part I", series: "Buffy: Season 8", volume: 1, on_display: true)
        
        book_4 = store_2.books.create!(name: "The Long Way Home: Part II", series: "Buffy: Season 8", volume: 2, on_display: true)
        
        book_5 = store_3.books.create!(name: "The Long Way Home: Part III", series: "Buffy: Season 8", volume: 3, on_display: false)
        book_6 = store_3.books.create!(name: "The Long Way Home: Part IV", series: "Buffy: Season 8", volume: 4, on_display: true)
        
        book_7 = store_4.books.create!(name: "The Gathering Storm", series: "Dark Knights of Steel", volume: 3, on_display: true)
        
        book_8 = store_5.books.create!(name: "The Chain", series: "Buffy: Season 8", volume: 5, on_display: false)
