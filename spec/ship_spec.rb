require 'ship'
require 'destroyer'

describe Ship do

  context 'has by default' do
   it 'start position of A1' do
    expect(subject.start_position).to eq "A1"
    end
  end

  context 'can create a ship' do
    it 'size 2' do
      destroyer = Destroyer.new("A1")
      expect(destroyer.size).to eq 2
    end
  end

end