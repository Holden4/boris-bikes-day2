require 'bike'

describe Bike do

  it { is_expected.to respond_to :working? }

  it 'is broken and users can report that' do
    subject.report_broken
    expect(subject).to be_broken
  end

end
