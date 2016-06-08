describe User, type: :model do

  it { is_expected.to have_many :statements }
  it { is_expected.to have_many :votes }
  it { is_expected.to have_many :voted_statements }

end
