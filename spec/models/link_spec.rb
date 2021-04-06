require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) { Link.create(url: 'https://josias-alvarado.me') }
  it 'is not valid without the URL attribute' do
    expect(Link.new).to_not be_valid
  end
  it 'is valid with attributes' do
    expect(link).to be_valid
  end
  it 'is not valid with a dead URL' do
    expect(Link.create(url: 'https://pointerish.github.io/josias-alvarado-portfolio/deadpath')).to validate_url_of(:url)
  end
  it '#to_s equals value of original URL' do
    expect(link.to_s).to eq('https://josias-alvarado.me')
  end
end
