require 'ship'

describe Ship do

  context 'has by default' do
   it 'start position of A1' do
    expect(subject.start_position).to eq "A1"
    end
  end
end