class PagesController < ApplicationController
    def home
        @burger = Menu.find_by(name: "Burgers").items
        @fries = Menu.find_by(name: "Fries").items
        @drinks = Menu.find_by(name: "Drinks").items
        @random_items = Item.order(Arel.sql("RANDOM()")).limit(3)
    end

    def about
    end
end
