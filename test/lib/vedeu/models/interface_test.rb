require 'test_helper'

module Vedeu
  describe Interface do
    let(:interface) {
      Interface.new({
        name:  '#initialize',
        group: 'my_group',
        lines: [],
        colour: {
          foreground: '#ff0000',
          background: '#000000'
        },
        geometry: {
          y: 3,
          x: 5,
          width: 10,
          height: 15,
        },
        current: "\e[1;1H#initialize"
      })
    }

    describe '#attributes' do
      it 'returns the value' do
        interface.attributes.must_equal(
          {
            name: '#initialize',
            group: 'my_group',
            lines: [],
            colour: {
              foreground: '#ff0000',
              background: '#000000'
            },
            style: '',
            geometry: {
              y: 3,
              x: 5,
              width: 10,
              height: 15
            },
            cursor: true,
            delay: 0.0,
            current: "\e[1;1H#initialize"
          }
        )
      end
    end

    describe '#name' do
      it 'returns the value' do
        interface.name.must_equal('#initialize')
      end
    end

    describe '#group' do
      it 'returns the value' do
        interface.group.must_equal('my_group')
      end
    end

    describe '#lines' do
      it 'returns the value' do
        interface.lines.must_equal([])
      end
    end

    describe '#colour' do
      it 'returns the value' do
        interface.colour.must_be_instance_of(Colour)
      end
    end

    describe '#style' do
      it 'returns the value' do
        interface.style.must_equal('')
      end
    end

    describe '#geometry' do
      it 'returns the value' do
        interface.geometry.must_be_instance_of(Geometry)
      end
    end

    describe '#cursor' do
      it 'returns the value' do
        interface.cursor.must_equal(true)
        Interface.new({ cursor: false }).cursor.must_equal(false)
      end
    end

    describe '#delay' do
      it 'returns the value' do
        interface.delay.must_equal(0.0)
      end
    end

    describe '#to_s' do
      it 'returns an string' do
        Interface.new({
          name:   '#to_s',
          lines:  [],
          colour: {
            foreground: '#ff0000',
            background: '#000000'
          },
          geometry: {
            width:  9,
            height: 3
          }
        }).to_s.must_equal(
          "\e[38;5;196m\e[48;5;16m" \
          "\e[1;1H         \e[1;1H" \
          "\e[2;1H         \e[2;1H" \
          "\e[3;1H         \e[3;1H"
        )
      end
    end
  end
end
