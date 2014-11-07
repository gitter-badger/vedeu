require 'test_helper'

module Vedeu

  describe MenuItem do

    describe '#initialize' do
      let(:menu_item) { MenuItem.new }

      it 'returns an instance of itself' do
        menu_item.must_be_instance_of(MenuItem)
      end
    end

  end # MenuItem

end # Vedeu
