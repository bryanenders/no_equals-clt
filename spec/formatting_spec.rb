require 'spec_helper'

module NoEquals::CLT
  describe Formatting do
    describe '::perform' do
      it 'formats integral floats without fractional part' do
        expect(Formatting.perform(2.0)).to eq('2')
      end
      it 'formats non-integral floats with fractional part' do
        expect(Formatting.perform(3.14159)).to eq('3.14159')
      end
    end
  end
end
