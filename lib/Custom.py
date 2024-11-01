from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Custom:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def add_items_to_cart_and_checkout(self, productsList):
        print(productsList)
        i = 1
        productsTitles = self.selLib.get_webelements("xpath:.//*[@class='inventory_item_label']/a/div")
        for productsTitle in productsTitles:
            if productsTitle.text in productsList:
                self.selLib.click_button("xpath:.//*[@class='pricebar']/button")
            i = i + 1
        self.selLib.click_link("xpath:.//a[@class='shopping_cart_link']")