feature "nested forms" do
  describe "hashes" do
  end

  context "arrays" do
    describe "lamp colors" do
      it "should have 4 colors under the 'lamp' key (use IDs to help identify the fields)" do
        colors = ['red', 'green', 'blue', 'yellow']

        visit "/lamp"

        4.times do |n|
          fill_in "color_#{n}", with: colors[n]
        end

        click_button "Save"

        expect(page).to have_content colors.join(',')
      end
    end
  end
end
