require 'docking_station'
require 'bike'

describe DockingStation do
  bike = Bike.new

  it 'demonstrates default capacity when instantiating' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  # describe '#initialize' do
  #   it 'varies capacity' do
  #     station = DockingStation.new(33)
  #     33.times { station.dock Bike.new }
  #     expect { station.dock Bike.new }.to raise_error(RuntimeError, 'Station is full!')
  #   end
  # end

  describe '#initialize' do
    it 'defaults to class constant' do
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Station is full!'
    end
  end

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'releases a docked bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error if no bikes available' do
      expect { subject.release_bike }.to raise_error(RuntimeError, 'No bikes available!')
    end
  end

  describe '#working?' do
    it "checks the bike is working" do
      expect(bike).to be_working
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument}

    it 'docks the given bike' do
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'raises an error if full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error(RuntimeError, 'Station is full!')
    end

  end

end
