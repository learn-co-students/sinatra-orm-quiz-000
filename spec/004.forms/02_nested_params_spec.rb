require_relative './004_forms_spec_helper'

# Nested Forms
#
# Instructions:
#
# Edit lamp_form.erb and table_form.erb to match the specs below

feature "nested params" do
  context "views" do
    describe "table_form.erb" do
      # Expected params hash:
      # {
      #   table: {
      #     name: 'Foo',
      #     wood: 'Maple',
      #     price: 1000
      #   }
      # }

      it "has 'name', 'wood', and 'price' keys under the 'table' key" do
        name = "Kitchen Table"
        wood = "Maple"
        price = 1200

        visit "/tables/new"

        # Supply input IDs for the these matchers to reference.
        fill_in "table[name]", with: name
        fill_in "table[wood]", with: wood
        fill_in "table[price]", with: price

        click_button "Save"

        expect(page).to have_content name.upcase
        expect(page).to have_content wood.upcase
        expect(page).to have_content price
      end
    end
  end

  context "views" do
    describe "lamp colors" do
      # Expected params hash:
      # {
      #   lamp: {
      #     colors: ['red', 'blue']
      #   }
      # }

      it "has 4 colors under the 'lamp' key (use IDs to help identify the fields)" do
        colors = ['red', 'green', 'blue', 'yellow']

        visit "/lamps/new"

        # Supply input IDs for the these matchers to reference.
        4.times do |n|
          fill_in "color_#{n}", with: colors[n]
        end

        click_button "Save"

        expect(page).to have_content colors.join(',')
      end
    end
  end
end
